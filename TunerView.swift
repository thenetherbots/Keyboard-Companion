import SwiftUI

struct TunerView: View {
    @StateObject private var viewModel = AudioViewModel()
    
    var body: some View {
        VStack {
            Text("Detected Pitch: \(viewModel.detectedPitch)")
                .font(.title)
            Text("Frequency: \(viewModel.detectedFrequency)")
                .font(.subheadline)
        }
        .onAppear {
            viewModel.startAudioProcessing()
        }
    }
}

