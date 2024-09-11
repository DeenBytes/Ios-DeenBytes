import SwiftUI
import AVFoundation

struct Alphabet: Identifiable, Equatable {
    let id = UUID()
    let letterImageName: String
    let imageName: String
    let songName: String
}

func configureAudioSession() {
    do {
        try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
        try AVAudioSession.sharedInstance().setActive(true)
    } catch {
        print("Failed to configure the audio session: \(error.localizedDescription)")
    }
}


let alphabets: [Alphabet] = [
    Alphabet(letterImageName: "letterAlif", imageName: "rabbit", songName: "alif"),
    Alphabet(letterImageName: "letterbaa", imageName: "house", songName: "ba"),
    Alphabet(letterImageName: "lettertaaa", imageName: "apple", songName: "taa"),
    Alphabet(letterImageName: "letterthaaa", imageName: "snowman", songName: "tha"),
    Alphabet(letterImageName: "letterjeem", imageName: "camel", songName: "jiim"),
    Alphabet(letterImageName: "letterhaa", imageName: "horse", songName: "ha"),//Stone Missing
    Alphabet(letterImageName: "letterkha", imageName: "bread", songName: "kha"),
    Alphabet(letterImageName: "letterdaal", imageName: "cycle", songName: "daal"),
    Alphabet(letterImageName: "letterthaal", imageName: "corn", songName: "thaal"),
    Alphabet(letterImageName: "letterra", imageName: "leaf", songName: "ra"),
    Alphabet(letterImageName: "letterzaay", imageName: "giraf", songName: "zay"),
    Alphabet(letterImageName: "letterseen", imageName: "clock", songName: "siin"),
    Alphabet(letterImageName: "lettersheen", imageName: "sun", songName: "shiin"),
    Alphabet(letterImageName: "lettersaad", imageName: "rocket", songName: "saad"),
    Alphabet(letterImageName: "letterdaad", imageName: "lamp", songName: "daad"),
    Alphabet(letterImageName: "lettertaa", imageName: "aeroplane", songName: "taa"),
    Alphabet(letterImageName: "letterthaa", imageName: "letter", songName: "thaa"),//1
    Alphabet(letterImageName: "letterayn", imageName: "redflag", songName: "ayn"),
    Alphabet(letterImageName: "letterghayn", imageName: "submarine", songName: "ghayn"),
    Alphabet(letterImageName: "letterfaa", imageName: "elephant", songName: "fa"),
    Alphabet(letterImageName: "letterqaaf", imageName: "pen", songName: "qaf"),
    Alphabet(letterImageName: "letterkaaf", imageName: "book", songName: "kaf"),
    Alphabet(letterImageName: "letterlaam", imageName: "lemon", songName: "lam"),
    Alphabet(letterImageName: "lettermeem", imageName: "keys", songName: "miim"),
    Alphabet(letterImageName: "letternoon", imageName: "star", songName: "nuun"),
    Alphabet(letterImageName: "letterha", imageName: "gift", songName: "hha"),
    Alphabet(letterImageName: "letterwaw", imageName: "rose", songName: "waw"),
    Alphabet(letterImageName: "letteryaa", imageName: "hand", songName: "ya")
    // Add other alphabets and corresponding images
]

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
//            audioPlayer?.numberOfLoops = -1 // Loop indefinitely
            audioPlayer?.play()
        } catch {
            print("Could not find and play the sound file.")
        }
    } else {
        print("Audio file not found.")
    }
}

struct AlphabetView: View {
    @State private var selectedAlphabet: Alphabet = alphabets[0]
    @State private var rotationAngle: Double = 0

    var body: some View {
        ZStack {
            // Full-screen background image
            Image("backgroundAlphabet")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Header Section
                HStack {
                    Button(action: {
                        // Action for back button
                    }) {
                        Image("back")
                            .resizable()
                            .frame(width: 34, height: 26)
                    }
                    
                    Spacer()
                    
                    Image("Alphabet")
                        .resizable()
                        .frame(width: 150, height: 30)
                    
                    Spacer()
                }
                
                Spacer()

                // Alphabet Scroll View
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(alphabets) { alphabet in
                            Button(action: {
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    selectedAlphabet = alphabet
                                    rotationAngle += 360 // Increase rotation angle by 360 degrees
                                }
                                playSound(sound: alphabet.songName, type: "mp3")
                            }) {
                                Image(alphabet.letterImageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: selectedAlphabet.id == alphabet.id ? 100 : 80,
                                           height: selectedAlphabet.id == alphabet.id ? 120 : 80)
                                    .scaleEffect(selectedAlphabet.id == alphabet.id ? 1.2 : 0.8)
                                    .animation(
                                        Animation.interpolatingSpring(stiffness: 100, damping: 5)
                                            .repeatCount(1, autoreverses: true)
                                    )
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 60)
                }

                Spacer()

                // Main content area with background
                ZStack {
                    // Background image for the content area
                    Image(selectedAlphabet.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 500)
                        .rotation3DEffect(
                            .degrees(rotationAngle),
                            axis: (x: 0, y: 1, z: 0)
                        )
                        .animation(.easeInOut(duration: 0.5), value: rotationAngle)
                }

                Spacer()
            }
            .padding()
        }

    }
}


struct AlphabetView_Previews: PreviewProvider {
    static var previews: some View {
        AlphabetView()
    }
}
