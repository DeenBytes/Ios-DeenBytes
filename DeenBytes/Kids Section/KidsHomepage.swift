import SwiftUI


struct KidsHomepageView: View {
    @State private var isAnimating = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                KidsHeaderView()
                    .offset(y: isAnimating ? 0 : -UIScreen.main.bounds.height)
                    .animation(.easeOut(duration: 1).delay(0.1), value: isAnimating)
                
                // Prayer Times Section
                PrayerTimesView()
                    .padding(.horizontal, 24)
                    .offset(y: isAnimating ? 0 : -UIScreen.main.bounds.height)
                    .animation(.easeOut(duration: 1).delay(0.3), value: isAnimating)
                
                // Quiz Banner
                QuizBannerView()
                    .offset(y: isAnimating ? 0 : -UIScreen.main.bounds.height)
                    .animation(.easeOut(duration: 1).delay(0.5), value: isAnimating)

                // Let's Play Section
                LetsPlaySection()
                    .padding(.horizontal, 24)
                    .offset(y: isAnimating ? 0 : -UIScreen.main.bounds.height)
                    .animation(.easeOut(duration: 1).delay(0.7), value: isAnimating)
                
                Spacer()
            }
        }
        .onAppear {
            isAnimating = true
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color.gray.opacity(0.1))
    }
}


struct KidsHeaderView: View {
    var body: some View {
        ZStack(alignment:.top){
            Image("kidshomeback")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            Spacer()
            
            HStack {
                VStack(alignment:.leading){
                    Text("Hi Champ")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("let’s make your day productive")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    }
                    .padding()
               

                Spacer()

                Image("kidhome")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.white)
            }
            .padding()
            .padding(.top,30)
            
            
        }
       
        
    }
}

struct PrayerTimesView: View {
    var body: some View {
        HStack(spacing: 15) {
            PrayerTimeCard(prayerName: "fajrkids", time: "03:56 am")
            PrayerTimeCard(prayerName: "dhukids", time: "03:56 am")
            PrayerTimeCard(prayerName: "asrkids", time: "03:56 am")
            PrayerTimeCard(prayerName: "magkids", time: "03:56 am")
            PrayerTimeCard(prayerName: "ishakids", time: "03:56 am")
        }
        .padding()
        .background(Color.white)
        .cornerRadius(24)
        .offset(y:-60)
        .shadow(radius: 2)
    }
}

struct PrayerTimeCard: View {
    let prayerName: String
    let time: String
    
    // State to determine if the card is selected or not
     @State private var isSelected: Bool = false
    
    var body: some View {
        VStack {
            Image(prayerName)
                .resizable()
                .frame(width: 57, height: 63)
                .cornerRadius(16)
                .scaleEffect(isSelected ? 1.2 : 1.0) // Apply scaling effect
                .animation(.easeInOut, value: isSelected) // Add smooth animation
            
            Text(time)
                .font(.caption)
                .foregroundColor(.black)
        }
        .onTapGesture {
                    isSelected.toggle() // Toggle selection on tap
                }
      
        
    }
}


struct QuizBannerView: View {
    let images = ["kidsbanner2", "kidsbanner1", "kidsbanner2"] // Replace with your image names
    
    @State private var offset: CGFloat = 0
    @State private var isFloating = false

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack() {
                    ForEach(images, id: \.self) { image in
                        Image(image)
                            .resizable()
                            .frame(width: 350, height: 200)
                            .clipped()
                    }
                }
            }
            .padding(.leading, 32)
            .frame(width: geometry.size.width, height: geometry.size.height)
            .offset(y: offset)
            .onAppear {
                startFloating()
            }
        }
        .frame(height: 250)
        .offset(y:-70)
    }
    
    private func startFloating() {
        withAnimation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
            offset = 20
        }
    }
}


struct LetsPlaySection: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Let's Play")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 10)

            GridStack(rows: 4, columns: 2) { row, col in
                GameCardView(gameName: gameData[row * 2 + col].name, imageName: gameData[row * 2 + col].imageName)
            }
        }  .offset(y:-90)// Adjust the height as needed
    }
}

struct GameCardView: View {
    let gameName: String
    let imageName: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
            
            Text(gameName)
                .font(.headline)
                .padding(.top, 5)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

struct Game: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
}

let gameData = [
    Game(name: "Arabic Alphabet", imageName: "arabic_alphabet"),
    Game(name: "Arabic Counting", imageName: "arabic_counting"),
    Game(name: "5 Pillar of Islam", imageName: "pillar_of_islam"),
    Game(name: "Pillar of Iman", imageName: "pillar_of_iman"),
    Game(name: "Islamic Calendar", imageName: "islamic_calendar"),
    Game(name: "Friday Sunnah", imageName: "friday_sunnah"),
    Game(name: "Major Sins in Islam", imageName: "major_sins"),
    Game(name: "Deen Quiz", imageName: "deen_quiz")
]


struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
        VStack {
            ForEach(0 ..< rows, id: \.self) { row in
                HStack {
                    ForEach(0 ..< columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}


struct KidsHomepageView_Previews: PreviewProvider {
    static var previews: some View {
        KidsHomepageView()
    }
}

