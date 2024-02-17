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

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Add your components here
                    Text("Welcome to the Music App")
                        .font(.largeTitle)
                        .padding()

                    // Example of a quest card
                    VStack(alignment: .leading) {
                        Text("Daily Quest")
                            .font(.headline)
                            .padding(.bottom, 1)
                        Text("Practice for 20 minutes")
                            .font(.subheadline)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(12)
                    .padding()

                    // Add more components as needed
                }
            }
            .navigationTitle("Home")
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
