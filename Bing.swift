import SwiftUI

struct ContentView: View {
    // Define some constants for the app's colors and fonts
    let backgroundColor = Color(red: 0.09, green: 0.09, blue: 0.09)
    let foregroundColor = Color(red: 0.93, green: 0.93, blue: 0.93)
    let accentColor = Color(red: 0.95, green: 0.76, blue: 0.29)
    let titleFont = Font.custom("Chalkduster", size: 24)
    let subtitleFont = Font.custom("Chalkduster", size: 18)
    let iconFont = Font.custom("Chalkduster", size: 36)
    
    var body: some View {
        // Use a ZStack to create a dark background
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            // Use a VStack to arrange the views vertically
            VStack {
                // Create a HStack for the title and the indicators
                HStack {
                    // Create a Text view for the title
                    Text("Lessons: updated")
                        .font(titleFont)
                        .foregroundColor(foregroundColor)
                        .padding()
                    
                    // Use a Spacer to push the indicators to the right
                    Spacer()
                    
                    // Create a HStack for the flames indicator
                    HStack {
                        // Create an Image view for the flames icon
                        Image(systemName: "flame.fill")
                            .font(iconFont)
                            .foregroundColor(accentColor)
                        
                        // Create a Text view for the flames number
                        Text("12")
                            .font(subtitleFont)
                            .foregroundColor(foregroundColor)
                    }
                    .padding()
                    
                    // Create a HStack for the diamonds indicator
                    HStack {
                        // Create an Image view for the diamonds icon
                        Image(systemName: "diamond.fill")
                            .font(iconFont)
                            .foregroundColor(accentColor)
                        
                        // Create a Text view for the diamonds number
                        Text("249")
                            .font(subtitleFont)
                            .foregroundColor(foregroundColor)
                    }
                    .padding()
                }
                
                // Create a TextField view for the search bar
                TextField("Unit 1 Basic notes", text: .constant(""))
                    .font(subtitleFont)
                    .foregroundColor(foregroundColor)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(foregroundColor.opacity(0.2)))
                    .padding()
                
                // Create a HStack for the circular icons
                HStack {
                    // Use a ForEach loop to create four icons with different labels and images
                    ForEach(0..<4) { index in
                        // Create a VStack for each icon
                        VStack {
                            // Create a ZStack for the circular button
                            ZStack {
                                // Create a Circle view for the outer ring
                                Circle()
                                    .stroke(foregroundColor, lineWidth: 4)
                                    .frame(width: 80, height: 80)
                                
                                // Create a Circle view for the inner fill
                                Circle()
                                    .fill(backgroundColor)
                                    .frame(width: 72, height: 72)
                                
                                // Create an Image view for the icon image
                                Image(systemName: iconImage(index: index))
                                    .font(iconFont)
                                    .foregroundColor(accentColor)
                            }
                            
                            // Create a Text view for the icon label
                            Text(iconLabel(index: index))
                                .font(subtitleFont)
                                .foregroundColor(foregroundColor)
                                .padding()
                        }
                    }
                }
                
                // Use a Spacer to push the views to the top
                Spacer()
            }
        }
    }
    
    // Define a function that returns the icon image name based on the index
    func iconImage(index: Int) -> String {
        switch index {
        case 0:
            return "music.note"
        case 1:
            return "music.note.list"
        case 2:
            return "star.fill"
        case 3:
            return "star"
        default:
            return "questionmark"
        }
    }
    
    // Define a function that returns the icon label based on the index
    func iconLabel(index: Int) -> String {
        switch index {
        case 0:
            return "Learn C+D"
        case 1:
            return "Learn E"
        case 2:
            return "Hot Cross Buns"
        case 3:
            return "Review"
        default:
            return "Unknown"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
