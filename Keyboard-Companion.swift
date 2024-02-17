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


// Home Screen

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack {
                // Streak header
                VStack(alignment: .leading) {
                    Text("12 day streak")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Text("You've extended your streak 6 hours before average.")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                .padding(.top)

                // Quests section
                VStack(alignment: .leading) {
                    Text("QUESTS")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
                    
                    QuestRow(title: "Practice for 10 min", completion: 0.9)
                    QuestRow(title: "Play 3 songs", completion: 0.66)
                    QuestRow(title: "Start a friends quest", completion: 0)
                }
                .padding(.vertical)

                // My Current Songs section
                VStack(alignment: .leading) {
                    Text("MY CURRENT SONGS")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)

                    SongProgressRow(songTitle: "Eine Kleine Nachtmusik", progress: 0.5)
                    SongProgressRow(songTitle: "Für Elise", progress: 0.75)
                    SongProgressRow(songTitle: "Vivaldi Spring", progress: 0.2)
                }
                .padding(.vertical)
            }
            .padding(.horizontal)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .foregroundColor(.white)
    }
}

struct QuestRow: View {
    var title: String
    var completion: Float
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            ProgressBar(progress: completion)
        }
    }
}

struct SongProgressRow: View {
    var songTitle: String
    var progress: Float
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(songTitle)
                .font(.headline)
            ProgressBar(progress: progress)
        }
        .padding(.vertical, 4)
    }
}

struct ProgressBar: View {
    var progress: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width, height: 5)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)

                Rectangle().frame(width: CGFloat(progress) * geometry.size.width, height: 5)
                    .foregroundColor(Color.blue)
                    .animation(.linear)
            }
            .cornerRadius(45.0)
        }
        .frame(height: 5)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


// Lessons view
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
