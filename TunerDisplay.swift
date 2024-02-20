import SwiftUI

@main // Marks this struct as the entry point of the application.
struct TunerDisplay: App {
    var body: some Scene {
        WindowGroup {
            TunerView() // Your TunerView is called here.
        }
    }
}
