import SwiftUI
import AVFoundation

struct CountingView: View {
    let numbers = ["١", "٢", "٣", "٤", "٥", "٦", "٧", "٨", "٩", "۱۰"]
    let colors: [String: Color] = [
        "١": .red, "٢": .blue, "٣": .green,
        "٤": .orange, "٥": .purple, "٦": .pink,
        "٧": .yellow, "٨": .teal, "٩": .brown, "۱۰": .cyan
    ]
    let images: [String: String] = [
        "١": "countingcloud1", "٢": "countingcloud2", "٣": "countingcloud3",
        "٤": "countingcloud4", "٥": "countingcloud5", "٦": "countingcloud6",
        "٧": "countingcloud7", "٨": "countingcloud8", "٩": "countingcloud9", "۱۰": "countingcloud10"
    ]
    
    let sounds: [String: String] = [
         "١": "one", "٢": "two", "٣": "three",
         "٤": "four", "٥": "five", "٦": "six",
         "٧": "seven", "٨": "eight", "٩": "nine", "۱۰": "ten"
     ]

    @State private var selectedNumber: String? = nil
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    // Action for back button
                }) {
                    Image("back")
                        .resizable()
                        .frame(width: 34, height: 26)
                }
                
                Spacer()
                
                Image("countingheader")
                    .resizable()
                    .frame(width: 200, height: 30)
                Spacer()
            }
            .padding()

            Spacer()
            ScrollViewReader { scrollProxy in
                ScrollView(.horizontal, showsIndicators: false) {
                             HStack {
                                 ForEach(Array(numbers.prefix(10)), id: \.self) { number in
                                     GeometryReader { geo in
                                         Image(images[number] ?? "")
                                             .resizable()
                                             .frame(width: UIScreen.main.bounds.width * 0.9, height: 290)
                                             .offset(x: getCircularXOffset(geo: geo), y: getCircularYOffset(geo: geo))
                                             .scaleEffect(getScaleEffect(geo: geo))
                                             .padding(.top, 50)
                                             .opacity(selectedNumber == number ? 1 : 1)  // Show only the selected image
                                             .id(number) // Set ID for each image to use with ScrollViewReader
                                     }
                                     .frame(width: UIScreen.main.bounds.width * 0.8, height: 320)
                                 }
                             }
                         }
                         .frame(height: 320)
                         .onChange(of: selectedNumber) { newValue in
                             // Scroll to the selected image when a new number is selected
                             if let selectedNumber = newValue {
                                 withAnimation {
                                     scrollProxy.scrollTo(selectedNumber, anchor: .center)
                                 }
                             }
                             
                         }
                     }

            Spacer()
            
            // Number Grid with curved effect
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 5)) {
                ForEach(0..<10) { index in
                    GeometryReader { geo in
                        Text(numbers[index])
                            .font(.largeTitle)
                            .foregroundColor(colors[numbers[index]] ?? .black)
                            .padding(selectedNumber == numbers[index] ? 16 : 12) // Increase padding when selected
                            .background(
                                Circle()
                                    .fill(selectedNumber == numbers[index] ? Color(hex:"#FFFB75") : Color.white)
                                    .overlay(
                                        Circle()
                                            .stroke(Color(hex: "#EB6300"), lineWidth: selectedNumber == numbers[index] ? 2 : 0)
                                    )
                                    .shadow(radius: 4)
                            )
                            .offset(y: getCurveOffset(for: index) - 30)
                            .scaleEffect(selectedNumber == numbers[index] ? 1.5 : 1.0) // Increase size when selected
                            .animation(.spring(), value: selectedNumber) // Apply smooth animation
                            .onTapGesture {
                                selectedNumber = numbers[index]
                                playSound(sound: sounds[numbers[index]] ?? "")
                            }
                    }
                    .frame(height: 80)
                }
            }
            .environment(\.layoutDirection, .rightToLeft)
            .padding()

            Spacer()

            Image("bottomcountingimage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            }
        .background(
            Image("countingback")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        )
    }
    
    func playSound(sound: String) {
          guard let path = Bundle.main.path(forResource: sound, ofType: "mp3") else {
              print("Sound file not found.")
              return
          }

          let url = URL(fileURLWithPath: path)

          do {
              audioPlayer = try AVAudioPlayer(contentsOf: url)
              audioPlayer?.play()
          } catch {
              print("Error playing sound: \(error.localizedDescription)")
          }
      }
    
    
    func getCircularXOffset(geo: GeometryProxy) -> CGFloat {
        let midX = geo.frame(in: .global).midX
        let totalWidth = UIScreen.main.bounds.width
        let angle = (midX - totalWidth / 5) / totalWidth * .pi
        
        return sin(angle) * totalWidth / 50
    }

    func getCircularYOffset(geo: GeometryProxy) -> CGFloat {
        let midX = geo.frame(in: .global).midX
        let totalWidth = UIScreen.main.bounds.width
        let angle = (midX - totalWidth / 2) / totalWidth * .pi
        
        return -cos(angle) * 60
    }

    func getScaleEffect(geo: GeometryProxy) -> CGFloat {
        let midX = geo.frame(in: .global).midX
        let totalWidth = UIScreen.main.bounds.width
        let distance = abs(midX - totalWidth / 2)
        
        return max(1, 1 - (distance / totalWidth))
    }
    
    func getCurveOffset(for index: Int) -> CGFloat {
        let curveStrength: CGFloat = 35
        
        switch index {
        case 0, 4, 5, 9:
            return curveStrength
        case 1, 3, 6, 8:
            return curveStrength / 2
        case 2, 7:
            return 0
        default:
            return 0
        }
    }
}

struct CountingView_Previews: PreviewProvider {
    static var previews: some View {
        CountingView()
    }
}
