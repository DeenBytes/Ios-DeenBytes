import SwiftUI

struct ZoomedScrollView: View {
    let images = ["pillar1", "pillar2", "pillar3", "pillar4", "pillar5"]
    let rectGreenImages = ["rectgreen5", "rectgreen3", "rectgreen1", "rectgreen4", "rectgreen2"]
    @State private var currentIndex: Int = 2 // Set initial image index here
    
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
                
                Image("5pillar")
                    .resizable()
                    .frame(width: 200, height: 30)
                
                Spacer()
            }
            .padding()
            .padding(.top, 100)
            
            // Scrollable Image Section
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: -20) { // Negative spacing for overlapping
                        ForEach(images.indices, id: \.self) { index in
                            GeometryReader { geometry in
                                Image(images[index])
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 200, height: 460)
                                    .clipped()
                                    .opacity(getOpacity(for: index))
                                    .shadow(radius: 6)
                                    .scaleEffect(getScale(geo: geometry), anchor: .center)
                                    .animation(.easeOut(duration: 0.5), value: geometry.frame(in: .global).midX)
                                    .zIndex(getCustomZIndex(index: index))
                                    .onChange(of: geometry.frame(in: .global).midX) { _ in
                                        updateCurrentIndex(index: index, geometry: geometry)
                                    }
                            }
                            .frame(width: 200, height: 460)
                            .padding(.top, 12)
                        }
                    }
                    .padding(.horizontal, UIScreen.main.bounds.width / 2 - 110) // Adjust padding
                    .onAppear {
                        scrollToInitialImage(proxy: proxy)
                    }
                }
            }
            
            // Image below ScrollView with overlay text
            ZStack {
                Image(rectGreenImages[currentIndex])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(.horizontal, 16)
                    .offset(y: -10)
                
                ScrollView {
                    Text(currentText)
                        .font(.body)
                        .foregroundColor(.black)
                        .transition(.opacity)
                }
                .frame(height: 250)
                .padding(.horizontal,80)
                .offset(y:-40)
            }
            
            Spacer() // This will push the scroll view up and keep it near the header
        }
    }
    
    // Function to calculate the scale based on the card position
    func getScale(geo: GeometryProxy) -> CGFloat {
        let x = geo.frame(in: .global).midX
        let screenWidth = UIScreen.main.bounds.width
        let distance = abs(screenWidth / 2 - x)
        
        let scale = max(1 - (distance / 500), 0.6) // Larger scale as it gets closer to the center
        return scale
    }
    
    // Function to determine the opacity based on the current index
    func getOpacity(for index: Int) -> Double {
        return index == currentIndex ? 1.0 : 0.5 // Full opacity for selected image, lower for others
    }

    
    // Custom ZIndex to ensure correct overlapping order with pillar 4 behind pillar 3
    func getCustomZIndex(index: Int) -> Double {
        // Manually setting zIndex to ensure pillar 4 is behind pillar 3
        if index == 3 { // pillar 4
            return 1
        } else if index == 2 { // pillar 3
            return 2
        } else if index < 2 {
            return Double(index + 3)
        } else {
            return Double(-index)
        }
    }

    // Function to scroll to the initial image
    func scrollToInitialImage(proxy: ScrollViewProxy) {
        withAnimation {
            proxy.scrollTo(currentIndex, anchor: .center)
        }
    }
    
    // Update the current index based on the image index using a threshold for center position
    func updateCurrentIndex(index: Int, geometry: GeometryProxy) {
        let screenWidth = UIScreen.main.bounds.width
        let itemCenterX = geometry.frame(in: .global).midX
        let distanceFromCenter = abs(screenWidth / 2 - itemCenterX)
        
        let threshold: CGFloat = 100 // Adjust threshold as needed
        if distanceFromCenter < threshold {
            DispatchQueue.main.async {
                currentIndex = index
            }
        }
    }
    
    // Function to provide the text based on the current index
    var currentText: String {
        switch currentIndex {
        case 0:
            return """
             The Hajj pilgrimage is an obligation that should be completed at least once in all able Muslims lives. It is also believed that the journey allows Muslims to wipe away any sins and wipe
             the slate clean in front of Allah (SWT).
              Muslims retrace the route as followed by the Prophet Muhammad (PBUH) and prophets Ibrahim (AS) and Ismail (AS) before him, as well as the path that the wife of Ibrahim (AS), Hagar, ran seven times between two hills as she
              sought water for her dying son.
             In Islamic belief, Allah (SWT) created a spring that continues to run to this very day.

             """
        case 1:
            return  """
 It is the belief that Muslims should pray five times each day. Prayer is important as it allows Muslims to communicate with Allah, listen to Allah and follow in the footsteps of the prophets.
      Prayer is performed five times each day because of what the Qur’an says about prayer: Establish prayer at the decline of the sun [from its meridian] until the darkness of the night and [also] the Qur’an of dawn. Indeed, the recitation of dawn is ever witnessed.
(Qur'an 17:78).

There are five key things that Muslims must do when they come into contact with Allah through Salah. These includes:
1.Performing wudu
2.Praying five times each day at set times
3.Facing Makkah
4.Performing certain actions which include standing, bowing, prostrating and sitting
5.Reciting in Arabic
"""
        case 2:
            return  """
Shahadah signifies the declaration of faith and a commitment to the belief that there is only one God, Allah (SWT), and that He sent His Messenger, Prophet Muhammad (PBUH), to guide humanity. As the first of the Five Pillars of Islam, Shahadah is paramount, representing the essential step toward submitting to Allah (SWT) and affirming one’s intention to be a true follower of Islam. New converts to Islam are also required to recite the Shahadah as their initial act of joining the faith, marking
 their dedication to it.
"""
        case 3:
            return  """
Fasting from dawn to sunset is obligatory (fard) for all adult Muslims who are not acutely or chronically ill, travelling, elderly, breastfeeding, diabetic, pregnant, or menstruating.[16] The predawn meal is referred to as suhur, and the nightly feast that breaks the fast is called iftar.


The spiritual rewards (thawab) of fasting are believed to be multiplied during Ramadan. Accordingly, during the hours of fasting, Muslims refrain not only from food and drink, but also tobacco products, sexual relations, and sinful behavior, devoting themselves instead to prayer and study of the Quran.
"""
        case 4:
            return  """
Fasting from dawn to sunset is obligatory (fard) for all adult Muslims who are not acutely or chronically ill, travelling, elderly, breastfeeding, diabetic, pregnant, or menstruating. The predawn meal is referred to as suhur, and the nightly feast that breaks the fast is called iftar.
The spiritual rewards (thawab) of fasting are believed to be multiplied during Ramadan. Accordingly, during the hours of fasting, Muslims refrain not only from food and drink, but also tobacco products, sexual relations, and sinful behavior, devoting themselves instead to prayer and study of the Quran.
"""
        default:
            return "Default Text"
        }
    }
}

struct ZoomedScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ZoomedScrollView()
    }
}
