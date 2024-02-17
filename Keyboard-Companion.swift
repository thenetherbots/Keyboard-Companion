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


// HOME SCREEN SECTION


struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack {
                // Streak header
                StreakSectionView()
                
                // Quests section
                SectionHeaderView(title: "QUESTS")
                QuestRow(title: "Practice for 10 min", completion: 0.9)
                QuestRow(title: "Play 3 songs", completion: 0.66)
                QuestRow(title: "Start a friends quest", completion: 0)

                // Lessons section
                SectionHeaderView(title: "LESSONS")
                LessonRow(title: "Learn about chords", completion: 0.3)
                LessonRow(title: "Practice a new note", completion: 0.6)
                LessonRow(title: "Hand coordination exercises", completion: 0.8)

                // My Current Songs section
                SectionHeaderView(title: "MY CURRENT SONGS")
                SongProgressRow(songTitle: "Eine Kleine Nachtmusik", progress: 0.5)
                SongProgressRow(songTitle: "Für Elise", progress: 0.75)
                SongProgressRow(songTitle: "Vivaldi Spring", progress: 0.2)
            }
            .padding([.horizontal, .top])
            .padding(.bottom, 50) // Bottom padding for last section
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .foregroundColor(.white)
    }
}

struct StreakSectionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("12 day streak")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)

            Text("You've extended your streak 6 hours before average.")
                .font(.headline)
                .foregroundColor(.gray)
        }
        .padding(.bottom)
    }
}

struct SectionHeaderView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(title == "QUESTS" ? .green : .white)
            .padding(.vertical)
    }
}

struct QuestRow: View {
    var title: String
    var completion: Float
    
    var body: some View {
        ProgressBarRow(title: title, progress: completion)
    }
}

struct LessonRow: View {
    var title: String
    var completion: Float
    
    var body: some View {
        ProgressBarRow(title: title, progress: completion)
    }
}

struct SongProgressRow: View {
    var songTitle: String
    var progress: Float
    
    var body: some View {
        ProgressBarRow(title: songTitle, progress: progress)
    }
}

struct ProgressBarRow: View {
    var title: String
    var progress: Float
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
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

                Text("\(Int(progress * 100))%")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.leading, CGFloat(progress) * geometry.size.width - 30)
                    .animation(.linear)
            }
            .cornerRadius(45.0)
        }
        .frame(height: 20)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



// Lessons view
import SwiftUI

struct LessonsView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                // Top section with flames and trophy
                HStack {
                    Image(systemName: "flame.fill")
                        .foregroundColor(.red)
                    
                    Spacer()
                    
                    Text("12")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Image(systemName: "trophy.fill")
                        .foregroundColor(.yellow)
                }
                .padding(.horizontal)
                
                // Unit Title
                Text("Unit 1 Basic notes")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(10)
                
                // Lessons Buttons
                VStack(spacing: 15) {
                    LessonButton(title: "Learn C+D", iconName: "music.note", color: .blue)
                    LessonButton(title: "Learn E", iconName: "music.note", color: .green)
                    LessonButton(title: "Hot Cross Buns", iconName: "music.quarternote.3", color: .orange, isFavorite: true)
                    LessonButton(title: "Review", iconName: "star", color: .gray)
                }
                
                Spacer()
            }
            .padding(.top)
        }
    }
}

struct LessonButton: View {
    var title: String
    var iconName: String
    var color: Color
    var isFavorite: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(color)
                .font(.title)
            
            Text(title)
                .foregroundColor(.white)
                .font(.headline)
            
            if isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            
            Spacer()
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(20)
    }
}

struct LessonsView_Previews: PreviewProvider {
    static var previews: some View {
        LessonsView()
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
