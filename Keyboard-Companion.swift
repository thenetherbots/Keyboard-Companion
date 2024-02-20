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
            VStack(alignment: .center, spacing: 0) {    
                HStack {
                    // Streak header
                    //VStack(alignment: .leading) {
                    Text("9")
                        .padding([.top, .horizontal])
                        
                        .font(.system(size: 100))
                        .fontWeight(.thin)
                        .foregroundStyle(.white)
                        .frame(width: 86, height: 115)
                   
                    
                }
                        
                    Text("day streak!")
                    .padding([.horizontal])

                        .font(.title)
                        .fontWeight(.thin)
                        .foregroundStyle(.white)
                
                    Text("You've extended your streak 4 hours earlier than you normally do.")
                    .frame(width: 325, height: 65)
                    .background(.quaternary)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                //}
                //.padding(.top)
                
                // Quests section
                HStack(alignment: .center) {
                    VStack(alignment: .center) {
                        Text("QUESTS")
                            .font(.system(size: 35))
                            .padding([.bottom, .horizontal])
                            .fontWeight(.semibold)
                            .foregroundStyle(.green)
                        
                        QuestRow(title: "Practice for 10 min", completion: 0.9)
                        Text("9 / 10")
                            .italic()
                        QuestRow(title: "Play 3 songs", completion: 0.66)
                        Text("2 / 3")
                            .italic()
                        QuestRow(title: "Start a friends quest", completion: 0)
                        Text("0 / 1")
                            .italic()
                    }
                    .frame(width: 300)
                }
                .frame(width: 350)
                
                .padding(.vertical)
                
                // My Current Songs section
                HStack(alignment: .center) {
                    VStack(alignment: .center) {
                        Text("MY CURRENT SONGS")
                            .font(.system(size: 29))
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                        
                        SongProgressRow(songTitle: "Eine Kleine Nachtmusik", progress: 0.5)
                        Text("50%")
                            .italic()
                        SongProgressRow(songTitle: "Für Elise", progress: 0.75)
                        Text("75%")
                            .italic()
                        SongProgressRow(songTitle: "Vivaldi Spring", progress: 0.2)
                        Text("20%")
                            .italic()
                        
                    }
                    .padding(.vertical)
                    .frame(width: 300)
                }
                .frame(width: 350)
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
        VStack(alignment: .leading) {
            Text(title)
                .bold()
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
                Rectangle().frame(width: geometry.size.width, height: 7)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)
                
                Rectangle().frame(width: CGFloat(progress) * geometry.size.width, height: 7)
                    .foregroundColor(Color.blue)
                    .animation(.linear)
            }
            .cornerRadius(45.0)
        }
       // .frame(width: 300, height: 5)
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
        NavigationStack {
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
                            Text("Level 3")
                                .font(.title)
                                .italic()
                        }
                    }
                    .padding()
                    
                    HStack(alignment: .center) {
                        VStack(alignment: .center, spacing: 0) {
                            Button {
                            } label: {
                                Text("9 day streak")
                                    .font(.title)
                                    .frame(width: 300, height: 50)
                                    .padding()
                                    .background(.quaternary)
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                            }
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding([.top, .horizontal])
                    
                    HStack(alignment: .center) {
                        VStack(alignment: .center) { 
                            Text("total xp: 455")
                                .font(.title)
                                .frame(width: 300, height: 50)
                                .padding()
                                .background(.quaternary)
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                            
                        }
                    }
                }
                
                .padding([.top, .horizontal])
                
                ZStack(alignment: .center) {
                    NavigationLink(destination: LeaguesView()) {
                        Text("Gold League")
                            .font(.title)
                            .frame(width: 300, height: 50)
                            .padding()
                            .background(.yellow)
                            .opacity(0.75)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                    }
                    /*Button {
                     } label: {
                     Text("Gold League")
                     .font(.title)
                     }*/
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
        .foregroundStyle(.white)
    }
}
   


    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
        }
    }
    
    
    struct LeaguesView: View {
        var body: some View {
            NavigationView {
                List {
                    Section(header: Text("Silver League").font(.headline)) {
                        HStack {
                            Image(systemName: "shield")
                            Text("455 xp earned this week")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    ForEach(1..<13) { index in
                        HStack {
                            Text("\(index)")
                                .foregroundColor(index == 4 ? .green : .primary)
                            Image(systemName: "person.fill")
                            Text(index == 4 ? "You" : index >= 5 ? "friend\(index - 1)" : index < 4 ? "friend\(index) " : "Nobody")
                                .foregroundColor(index == 4 ? .green : .primary)
                        }
                        .padding()
                        .background(index == 4 ? Color.green.opacity(0.1) : Color.clear)
                        .cornerRadius(8)
                    }
                    
                    Text("PROMOTION ZONE")
                        .font(.footnote)
                        .foregroundColor(.green)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.vertical, 5)
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Leagues")
            
        }
    }
}

struct LeaguesView_Previews: PreviewProvider {
    static var previews: some View {
        LeaguesView()
    }
}
    
import SwiftUI

struct ConnectView: View {
        @State private var isConnected = false
        
        var body: some View {
                ZStack {
                        
                        VStack(spacing: 20) {
                                Text("CONNECT")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                                    .padding()
                                
                                if isConnected {
                                        ConnectedView()
                                    } else {
                                            DisconnectedView()
                                        }
                                
                                // Toggle Button
                                Button(action: {
                                        self.isConnected.toggle() // Toggle the connection state
                                    }) {
                                            Text(isConnected ? "DISCONNECT" : "CONNECT")
                                                .foregroundColor(.white)
                                                .padding()
                                                .frame(width: 300, height: 50)
                                                .background(Color.blue)
                                                .cornerRadius(10)
                                        }
                            }
                    }
            }
}

struct ConnectedView: View {
        var body: some View {
                VStack(spacing: 20) {
                        // Assuming you have a placeholder image for "Keyboard Companion"
                        Image(systemName: "iphone.gen1.radiowaves.left.and.right")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.white)
            
                        Text("Name's Companion")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 300, height: 75)
                            .background(Color.gray.opacity(0.5))
                            .cornerRadius(10)
                    }
            }
}

struct DisconnectedView: View {
        var body: some View {
                VStack(spacing: 20) {
                        // Placeholder for "Connect your Keyboard Companion" image
                        Image(systemName: "iphone.gen1.radiowaves.left.and.right") 
             // Replace this with your actual image name
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.gray)
            
                        Text("CONNECT YOUR\nKEYBOARD COMPANION")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .frame(width: 300, height: 60)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(10)
                    }
            }
}

struct ConnectView_Previews: PreviewProvider {
        static var previews: some View {
                ConnectView()
            }
}



