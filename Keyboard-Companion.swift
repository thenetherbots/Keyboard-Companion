import SwiftUI


struct MusicApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            LessonsView()
                .tabItem {
                    Label("Lessons", systemImage: "music.note.list")
                }
            
            SongsView()
                .tabItem {
                    Label("Songs", systemImage: "music.quarternote.3")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
            
            LeaguesView()
                .tabItem {
                    Label("Leagues", systemImage: "list.number")
                }
            
            ConnectView()
                .tabItem {
                    Label("Connect", systemImage: "network")
                }
        }
    }
}

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Background color
                Color.black.edgesIgnoringSafeArea(.all)

                // Main content
                VStack(alignment: .leading, spacing: 20) {
                    // Streak header
                    Text("12 day streak")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("You've extended your streak 6 hours before average.")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    // Quests section
                    Text("QUESTS")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
                    
                    // List of quests
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(systemName: "guitar") // Replace with custom icon
                            Text("Practice for 10 min")
                                .foregroundColor(.white)
                            Spacer()
                            ProgressView(value: 9, total: 10)
                        }
                        
                        HStack {
                            Image(systemName: "music.note.list") // Replace with custom icon
                            Text("Play 3 songs")
                                .foregroundColor(.white)
                            Spacer()
                            ProgressView(value: 2, total: 3)
                        }
                        
                        HStack {
                            Image(systemName: "person.2") // Replace with custom icon
                            Text("Start a friends quest")
                                .foregroundColor(.white)
                            Spacer()
                            ProgressView(value: 0, total: 1)
                        }
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .navigationBarHidden(true)
        }
    }
}

struct ProgressView: View {
    let value: CGFloat
    let total: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: 5)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemTeal))

                Rectangle().frame(width: min(CGFloat(self.value)/CGFloat(self.total) * geometry.size.width, geometry.size.width), height: 5)
                    .foregroundColor(Color(UIColor.systemBlue))
                    .animation(.linear)
            }
            .cornerRadius(45.0)
        }
    }
}


struct LessonsView: View {
    var body: some View {
        // Placeholder for the Lessons screen content
        Text("Lessons Screen")
    }
}

struct SongsView: View {
    var body: some View {
        // Placeholder for the Songs screen content
        Text("Songs Screen")
    }
}

struct ProfileView: View {
    var body: some View {
        // Placeholder for the Profile screen content
        Text("Profile Screen")
    }
}

struct LeaguesView: View {
    var body: some View {
        // Placeholder for the Leagues screen content
        Text("Leagues Screen")
    }
}

struct ConnectView: View {
    var body: some View {
        // Placeholder for the Connect screen content
        Text("Connect Screen")
    }
}
