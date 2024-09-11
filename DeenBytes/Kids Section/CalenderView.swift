import SwiftUI
import AVFoundation

struct CalendarItemView: View {
    @State private var isExpanded = false
    let imageName : String
    let songName: String
    let description: String  // New property for the description

    var body: some View {
        VStack {
            // Custom image with "Read more" text on top
                    ZStack {
                        Image(imageName)  // Replace with your image name
                            .resizable()
                            .frame(width: 305, height: 350) // Adjust size as needed
                            .shadow(radius: 2) // Add shadow for elevation\
                            .onTapGesture {
                                playSound(sound: songName, type: "mp3")
                            }

                        Button(action: {
                            withAnimation {
                                isExpanded.toggle()
                            }
                        }) {
                            Text("Read more")
                                .foregroundColor(.blue)
                                .underline()
                           
                        }
                        .offset(x:90,y:150)
                        
                    }

            if isExpanded {
                         ZStack {
                             Image("calenderbackgroundexpand")  // Expanded image
                                 .resizable()
                                 .scaledToFit()
                                 .frame(width: 305, height: 250)
                                 .offset(y:-26)
                                 .transition(.slide) // Optional: Add a transition effect
                             
                             Text(description)
                                 .padding(.horizontal, 35)
                                 .transition(.opacity)
                                 .offset(y:-25)
                         }
                         .animation(.easeInOut, value: isExpanded) // Apply animation when expanded
                     }
                 }
                 .frame(width: UIScreen.main.bounds.width * 0.9)
                 .padding(.vertical)
               
    }
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


struct CalendarView: View {
    var body: some View {
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
                
                Image("calendartitle")
                    .resizable()
                    .frame(width: 200, height: 30)
                
                Spacer()
            }
            .padding() // Add padding to the header
            ScrollView {
                VStack(spacing: 0) {
                    CalendarItemView(imageName: "calender1",songName: "muharram", description: "The first month of the Islamic calendar. It is one of the four sacred months in which warfare is prohibited. The 10th day, known as Ashura, is significant for fasting and commemorating historical events, including the martyrdom of Imam Hussain at Karbala.")
                    
                    CalendarItemView(imageName: "calender2",songName: "safar", description: "The second month. Some consider it an unlucky month, though this is not based on Islamic teachings. It is sometimes associated with superstitions, but these are discouraged in Islam.")
                    
                    CalendarItemView(imageName: "calender3",songName: "rabi_al_awwal", description: "The third month. It is significant because it is the birth month of the Prophet Muhammad (peace be upon him). The 12th of Rabi' al-Awwal is widely celebrated as Mawlid al-Nabi (the Prophet's birthday).")
                    CalendarItemView( imageName: "calender4",songName: "rabi_al_thani", description: "The fourth month. It follows Rabi' al-Awwal and is generally a quiet month with no major Islamic events.")
                    CalendarItemView( imageName: "calender5",songName: "jumada_al_awwal", description: "Jumada al-Awwal is the fifth month of the Islamic calendar. It is also known as Jumada al-Ula.")
                    CalendarItemView( imageName: "calender6",songName: "jumada_al_thani", description: "Jumada al-Thani, also known as Jumada al-Akhir, is the sixth month of the Islamic calendar.")
                    CalendarItemView( imageName: "calender7",songName: "rajb", description: "Rajab is the seventh month of the Islamic calendar and is considered one of the four sacred months.")
                    CalendarItemView( imageName: "calender8",songName: "shaban", description: "Sha'ban is the eighth month of the Islamic calendar. It is the month before Ramadan.")
                    CalendarItemView( imageName: "calender9",songName: "ramadan", description: "Ramadan is the ninth month of the Islamic calendar, observed by Muslims worldwide as a month of fasting, prayer, and reflection.")
                    CalendarItemView( imageName: "calender10",songName: "shawwal", description: "Shawwal is the tenth month of the Islamic calendar. The first day of Shawwal is celebrated as Eid al-Fitr.")
                    CalendarItemView( imageName: "calender11",songName: "dhu_al_qidah", description: "Dhu al-Qidah is the eleventh month of the Islamic calendar and is considered one of the four sacred months.")
                    CalendarItemView( imageName: "calender12",songName: "dhu_al_hijjah", description: "The twelth and final month of the Islamic calendar. It is the month of the Hajj pilgrimage, one of the Five Pillars of Islam, and the second major Islamic festival, Eid al-Adha, which commemorates the willingness of Prophet Ibrahim (Abraham) to sacrifice his son in obedience to God.")
                }
            }
            
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
