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
                    Label("Leagues", systemImage: "medal.fill")
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
        ScrollView {
            VStack {
                // Streak header
                VStack(alignment: .leading) {
                    Text("12 day streak")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    Text("You've extended your streak 6 hours before average.")
                        .font(.headline)
                        .foregroundColor(.white)
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
                        .foregroundStyle(.white)
                    
                    SongProgressRow(songTitle: "Eine Kleine Nachtmusik", progress: 0.5)
                    SongProgressRow(songTitle: "Für Elise", progress: 0.75)
                    SongProgressRow(songTitle: "Vivaldi Spring", progress: 0.2)
                }
                .padding(.vertical)
            }
            .padding(.horizontal)
        }
            .foregroundColor(.white)
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
        HStack {
            Text(title)
            Spacer()
            ProgressBar(progress: completion)
        }
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

// LESSONS MENU

struct LessonsView: View {
    var body: some View {
        ScrollView {
            ZStack {
                VStack(spacing: 20) {
                    // Top section with flames and trophy
                    
                        HStack {
                            Spacer()
                            
                            Image(systemName: "flame.fill")
                                .foregroundColor(.orange)
                                .font(.system(size: 25))
                            
                            Text("12")
                                .foregroundColor(.orange)
                                .font(.title)
                                .fontWeight(.thin)
                            
                            Spacer()
                            
                            Image(systemName: "trophy.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 25))
                            Text("250")
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.thin)
                            
                            Spacer()
                    }
                    .padding(.horizontal)
                    
                    // Unit Title
                    Text("Unit 1: Basic notes")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(.quaternary)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    // Lessons Buttons
                    VStack(spacing: 5) {
                        ZStack {
                            Button (action: {
                                print("Round Action")
                            }) {
                                Image(systemName: "music.note")
                                    .font(.system(size: 60))
                                    .frame(width: 130, height: 130)
                                    .foregroundColor(Color.yellow)
                                    .opacity(0.5)
                                    .clipShape(Circle())
                                
                            }
                            Circle()
                                .stroke(lineWidth: 4)
                                .frame(width: 130, height: 130)
                                .foregroundColor(.yellow)
                                .opacity(0.5)
                        }
                            
                            Text("Learn C+D")
                                .fontWeight(.semibold)
                                .padding(5)
                                .opacity(0.5)
                        
                        
                        
                        Spacer()
                        
                        // Second Button
                        
                        Button (action: {
                            print("Round Action")
                        }) {
                            Image(systemName: "music.note")
                                .font(.system(size: 60))
                                .frame(width: 130, height: 130)
                                .foregroundColor(Color.green)
                                .background(.quinary)
                                .clipShape(Circle())
                        }
                        
                        Text("Learn E")
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        HStack {
                            Spacer()
                            
                            VStack {
                        
                                
                                Button (action: {
                                    print("Round Action")
                                }) {
                                    Image(systemName: "music.quarternote.3")
                                        .font(.system(size: 60))
                                        .frame(width: 130, height: 130)
                                        .foregroundColor(Color.green)
                                        .background(.quinary)
                                        .clipShape(Circle())
                                }
                                
                                Text("Hot Cross Buns")
                                    .fontWeight(.semibold) 
                            }
                            
                            Spacer()
                            
                            VStack {
                                Button (action: {
                                    print("Round Action")
                                }) {
                                    Image(systemName: "star.fill")
                                        .font(.system(size: 60))
                                        .frame(width: 130, height: 130)
                                        .foregroundColor(Color.yellow)
                                        .background(.quinary)
                                        .clipShape(Circle())
                                }
                                
                                 Text("Learn E")
                                     .fontWeight(.semibold) 
                            }
                            
                            Spacer()
                            
                        }
                        
                    }
                    
                    Spacer()
                }
                .padding(.top)
            }
        }
    }
}
    
struct LessonButton: View {
    var shape: any Shape
    var iconName: String
    var color: Color
    var isFavorite: Bool = false
    
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: iconName)
                    .foregroundColor(color)
                    .font(.title)
                    
                if isFavorite {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        
                    Spacer()
                }
                    
                    
            }
            .clipShape(Circle())
                
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(20)
    }
}
    
struct SongsView: View {
    
    // Define your Song model
    struct Song: Identifiable {
        let id = UUID()
        var title: String
        var level: String
        var image: String // Name of the image in your assets
        var composer: String
        var isRecommended: Bool
        var isPopular: Bool
        var isRecentlyStarted: Bool
    }
    
    // Dummy data for illustration
    let songs = [
        Song(title: "Hot Cross Buns", level: "Hard", image: "HotCrossBuns@3x", composer: "Traditional", isRecommended: false, isPopular: false, isRecentlyStarted: true),
        Song(title: "Ode To Joy", level: "Expert", image: "Beethoven@3x", composer: "Traditional", isRecommended: true, isPopular: false, isRecentlyStarted: true),
        Song(title: "Mary Had A Little Lamb", level: "Expert", image: "MaryHadALittleLamb@3x", composer: "Traditional", isRecommended: true, isPopular: true, isRecentlyStarted: true),
        Song(title: "Rush E", level: "Easy", image: "RushE@3x", composer: "Traditional", isRecommended: false, isPopular: true, isRecentlyStarted: true),
        // ... Add other songs
    ]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) { // Allow vertical scrolling
                VStack(alignment: .leading, spacing: 0) {
                    Text("Recently Played:")
                        .font(.title)
                        .padding([.top, .horizontal])
                    
                    // Horizontal ScrollView for recently started songs
                    // Seperate ScrollViews for different sections
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(songs.filter { $0.isRecentlyStarted }) { song in
                                NavigationLink(destination: SongDetailView(song: song)) {
                                    VStack {
                                        Image(song.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 200, height: 200)
                                            .cornerRadius(15)
                                        Text(song.title)
                                            .font(.headline)
                                            .foregroundStyle(.white)
                                        Text(song.level)
                                            .foregroundColor(song.level == "Easy" ? .green : song.level == "Medium" ? .yellow : song.level == "Hard" ? .orange : song.level == "Expert" ? .red : .white)
                                            .font(.subheadline)
                                    }
                                    .frame(width: 200, height: 250)
                                    .cornerRadius(10)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .frame(height: 270) // Adjust height to fit content
                    // Increase for bigger images
                    
                    // Spacer can be used to create some space between sections
                    // Spacer().frame(height: 30)
                    
                    Text("Popular:")
                        .font(.title)
                        .padding([.top, .horizontal])
                    
                    // Horizontal ScrollView for popular songs
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(songs.filter { $0.isPopular }) { song in
                                NavigationLink(destination: SongDetailView(song: song)) {
                                    VStack {
                                        Image(song.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 150, height: 150)
                                            .cornerRadius(15)
                                        Text(song.title)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                        Text(song.level)
                                            .foregroundColor(song.level == "Easy" ? .green : song.level == "Medium" ? .yellow : song.level == "Hard" ? .orange : song.level == "Expert" ? .red : .white)
                                            .font(.subheadline)
                                    }
                                    .frame(width: 150, height: 200)
                                    .cornerRadius(10)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .frame(height: 220) // Adjust height to fit content
                    // Increase for bigger images
                    
                    
                    
                    Text("Recommended:")
                        .font(.title)
                        .padding([.top, .horizontal])
                    
                    // ScrollView for Reccomended section
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(songs.filter { $0.isRecommended }) { song in
                                NavigationLink(destination: SongDetailView(song: song)) {
                                    VStack {
                                        Image(song.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 150, height: 150)
                                            .cornerRadius(15)
                                        Text(song.title)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                        Text(song.level)
                                            .foregroundColor(song.level == "Easy" ? .green : song.level == "Medium" ? .yellow : song.level == "Hard" ? .orange : song.level == "Expert" ? .red : .white)
                                            .font(.subheadline)
                                    }
                                    .frame(width: 150, height: 200)
                                    .cornerRadius(10)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .frame(height: 220) // Adjust height to fit content
                    // Increase for bigger images
                }
            }
            .navigationBarTitle("Songs", displayMode: .inline)
        }
    }
    
    
    struct SongDetailView: View {
        let song: Song
        
        var body: some View {
            VStack {
                // Your detailed song view components go here
                Text(song.title)
                // ... Other details
            }
        }
    }
}
    
import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding()
                    VStack(alignment: .leading) {
                        Text("Name")
                            .bold()
                            .font(.system(size: 45))
                        Text("@username")
                            .font(.headline)
                        Text("Level 1")
                            .font(.title)
                            .italic()
                    }
                }
                .padding()
                
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("streak: 12")
                            .font(.title)
                            .frame(width: 300, height: 50)
                            .padding()
                            .background(.quaternary)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
            
                    }
                    Spacer()
                   
                }
                .padding([.top, .horizontal])
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("total xp: 455")
                            .font(.title)
                            .frame(width: 300, height: 50)
                            .padding()
                            .background(.quaternary)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                    }
                    Spacer()
                }
                .padding([.top, .horizontal])
                
                ZStack {
                    Text("")
                        .font(.title)
                        .frame(width: 300, height: 50)
                        .padding()
                        .background(.yellow)
                        .opacity(0.5)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                    Text("league: gold")
                        .font(.title)
                    // big brain strats, using zstack to overlap
                }
                .padding()
                
                Text("FRIENDS")
                    .font(.headline)
                    .padding()
                
                ForEach(0..<3) { i in
                    HStack {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 75, height: 75)
                            .padding(.horizontal)
                        VStack(alignment: .leading) {
                            Text("friend\(i + 1)")
                                .font(.largeTitle)
                            Text("@friend\(i + 1)")
                                .font(.subheadline)
                        }
                        Spacer()
                    }
                    .padding()
                }
            }
        }
        .foregroundColor(.white)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
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
