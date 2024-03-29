// Just remember that in the MyApp file, rename the view to StaffLinesView()

import SwiftUI

struct StaffLinesView: View {
        @State var currentNotes = ["F6", "E6", "D6", "C6", "B5", "A5", "G5", "F5", "E5", "D5", "C5", "B4", "A4", "G4", "F4", "E4", "D4", "C4", "B3", "A3", "G3", "F3"] // Example notes array
        
        var body: some View {
                ScrollView(.horizontal, showsIndicators: false) {
            ZStack() {
                // Staff Lines
                staffLines
                
                HStack(spacing: 30) { // Adjust spacing as needed
                    ForEach(currentNotes.indices, id: \.self) { index in
                        noteView(for: currentNotes[index], at: index)
                    }
                }
                .padding(.vertical, 50) // Adjust vertical padding as needed
                .padding(.top, 20) // Start below the staff lines
            }
        }
        .frame(height: 300) // Adjust the frame height as needed
    }
    
    private var staffLines: some View {
        VStack(spacing: 10) { // Adjust the spacing to control the distance between staff lines
            ForEach(0..<5, id: \.self) { _ in
                Line()
                    .stroke(Color.white, style: StrokeStyle(lineWidth: 2, lineCap: .round))
                    .frame(width: CGFloat(currentNotes.count * 100), height: 15)           
            }
        }
    }
    
    private func noteView(for note: String, at index: Int) -> some View {
        ZStack {
            // Ledger Lines
            ForEach(ledgerLineOffsets(note: note), id: \.self) { offset in
                Line()
                    .stroke(Color.white, style: StrokeStyle(lineWidth: 2, lineCap: .round))
                    .frame(width: 50, height: 1)
                    .offset(x: 0, y: offset)
            }
            
            // Note Image
            Image("Image Asset") // Ensure you have this asset in your assets catalog
                .resizable()
                .frame(width: 32, height: 32 * 2.7314285714)
                .padding(.top, paddingForCurrentNote(note: note))
                .padding(.horizontal, 20)
                .rotationEffect(.degrees(isNoteAboveB5(note: note) ? 180 : 0))
        }
        .id(index)        
    }
        private func paddingForCurrentNote(note: String) -> CGFloat {
                switch note {
                    case "F3": return 164
                    case "G3": return 139
                    case "A3": return 116
                    case "B3": return 86
                    case "C4": return 64
                    case "D4": return 40
                    case "E4": return 16
                    case "F4": return -9
                    case "G4": return -35
                    case "A4": return -60 // -41 difference
            // upside down
                    case "B4": return -42
                    case "C5": return -18
                    case "D5": return 7
                    case "E5": return 32
                    case "F5": return 57
                    case "G5": return 81
                    case "A5": return 107
                    case "B5": return 130
                    case "C6": return 160
                    case "D6": return 181
                    case "E6": return 211
                    case "F6": return 231
                    default: return 57 // Default padding
                    }
            }
    
        private func ledgerLineOffsets(note: String) -> [CGFloat] {
                switch note {
                    case "C4", "B3": return [64]
                    case "A3", "G3": return [64, 89]
                    case "F3", "E3": return [64, 89, 114]
                    case "A5", "B5": return [-85]
                    case "C6", "D6": return [-85, -110]
                    case "E6", "F6": return [-85, -110, -135]
                    default: return []
                    }
            }
        
        private func isNoteAboveB5(note: String) -> Bool {
                // Adapted to use the passed note parameter for decision making
                let octave = Int(note.suffix(1)) ?? 0
                let noteLetter = String(note.prefix(1))
                
                if octave > 4 {
                    return true
                } else if octave == 4 && noteLetter == "B" {
                    return true
                } else {
                    return false
                }
                //return octave > 5 || (octave == 4 && noteLetter == "B")
            }
}
    

// Defines a simple horizontal line used for ledger lines
struct Line: Shape {
        func path(in rect: CGRect) -> Path {
                var path = Path()
                path.move(to: CGPoint(x: rect.minX, y: rect.midY))
                path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
                return path
            }
}

struct StaffLinesView_Previews: PreviewProvider {
        static var previews: some View {
                StaffLinesView()
            }
}
