import AVFoundation
import Accelerate
import SwiftUI


class AudioProcessor {
    var audioEngine = AVAudioEngine()    
    var fftSetup: FFTSetup?
    let log2n: vDSP_Length
    let n: Int
    let halfN: Int
    var realp: [Float]
    var imagp: [Float]
    
    // Callback for when a frequency is detected
    var onFrequencyDetected: ((Float) -> Void)?
    
    init(n: Int) {
        self.n = n
        self.halfN = n / 2
        self.log2n = vDSP_Length(log2(Float(n)))
        self.realp = [Float](repeating: 0, count: n / 2)
        self.imagp = [Float](repeating: 0, count: n / 2)
        self.fftSetup = vDSP_create_fftsetup(log2n, FFTRadix(kFFTRadix2))
    }
    
    deinit {
        if let fftSetup = self.fftSetup {
            vDSP_destroy_fftsetup(fftSetup)
        }
    }
    
    func startAudioEngine() {
        let inputNode = audioEngine.inputNode
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        
        inputNode.installTap(onBus: 0, bufferSize: AVAudioFrameCount(n), format: recordingFormat) { [weak self] (buffer, when) in
            self?.processBuffer(buffer)
        }
        
        do {
            try audioEngine.start()
        } catch {
            print("Could not start audio engine: \(error)")
        }
    }
    
    func processBuffer(_ buffer: AVAudioPCMBuffer) {
        guard let floatChannelData = buffer.floatChannelData else {
            print("Could not get float channel data from the buffer")
            return
        }
        
        let frameLength = buffer.frameLength
        let channelData = floatChannelData.pointee
        var windowedSignal = [Float](repeating: 0, count: Int(frameLength))
        let windowSize = vDSP_Length(frameLength)
        
        // Generate a Hanning window and apply it
        var window = [Float](repeating: 0, count: Int(windowSize))
        vDSP_hann_window(&window, windowSize, Int32(vDSP_HANN_NORM))
        vDSP_vmul(channelData, 1, window, 1, &windowedSignal, 1, vDSP_Length(frameLength))
        
        var realp = [Float](repeating: 0, count: halfN)
        var imagp = [Float](repeating: 0, count: halfN)
        
        realp.withUnsafeMutableBufferPointer { realpBP in
            imagp.withUnsafeMutableBufferPointer { imagpBP in
                var dspSplitComplex = DSPSplitComplex(realp: realpBP.baseAddress!, imagp: imagpBP.baseAddress!)
                
                windowedSignal.withUnsafeBytes { ptr in
                    let cptr = ptr.bindMemory(to: DSPComplex.self).baseAddress!
                    vDSP_ctoz(cptr, 2, &dspSplitComplex, 1, vDSP_Length(halfN))
                    
                    // Perform FFT
                    if let fftSetup = self.fftSetup {
                        vDSP_fft_zrip(fftSetup, &dspSplitComplex, 1, log2n, FFTDirection(FFT_FORWARD))
                        
                        // Convert complex magnitudes to real values
                        vDSP_zvmags(&dspSplitComplex, 1, realpBP.baseAddress!, 1, vDSP_Length(halfN))
                        
                        // Find the maximum frequency component
                        var maxVal: Float = 0
                        var maxIdx: vDSP_Length = 0
                        vDSP_maxvi(realpBP.baseAddress!, 1, &maxVal, &maxIdx, vDSP_Length(halfN))
                        
                        // Convert index of max frequency component to actual frequency
                        let sampleRate = Float(buffer.format.sampleRate)
                        let frequency = Float(maxIdx) * sampleRate / Float(n)
                        print("Detected frequency: \(frequency) Hz")
                        
                        // Here, call your frequency detection handler
                        DispatchQueue.main.async {
                            self.onFrequencyDetected?(frequency)
                        }
                    }
                }
            }
        }
    }
}
