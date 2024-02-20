import Foundation
import Combine

class AudioViewModel: ObservableObject {
    private var audioProcessor: AudioProcessor?
    @Published var detectedPitch: String = "Detecting pitch..."
    @Published var detectedFrequency: String = "0 Hz"
    
    init() {
        self.audioProcessor = AudioProcessor(n: 4096) // Adjust 'n' as necessary
        self.audioProcessor?.onFrequencyDetected = { [weak self] frequency in
            self?.updateFrequency(frequency: frequency)
        }
    }
    
    func startAudioProcessing() {
        self.audioProcessor?.startAudioEngine()
    }
    
    private func updateFrequency(frequency: Float) {
        DispatchQueue.main.async {
            self.detectedFrequency = String(format: "%.2f Hz", frequency)
            // Assuming you have a method to convert frequency to pitch
            self.detectedPitch = self.frequencyToPitch(frequency: frequency)
        }
    }
    
    private func frequencyToPitch(frequency: Float) -> String {
        // Implement the logic or use a library to convert frequency to musical pitch
        return "A4" // Placeholder
    }
}


