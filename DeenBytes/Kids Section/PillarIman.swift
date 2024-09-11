import SwiftUI

struct PillarView: View {
    @State private var selectedTab = 0
    @State private var rotationAngle: Double = 0.0
    
    var body: some View {
        ZStack {
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
                    
                    Image("6pillar")
                        .resizable()
                        .frame(width: 200, height: 30)
                    
                    Spacer()
                }
                .padding()
                
                ZStack {
                    // Background Image with Scroll View
                    TabView(selection: $selectedTab) {
                        Image("imanbackground1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .tag(0)
                        
                        Image("imanbackground2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .tag(1)
                        
                        Image("imanbackground3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .tag(2)
                        
                        Image("imanbackground4")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .tag(3)
                        
                        Image("imanbackground5")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .tag(4)
                        
                        Image("imanbackground6")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .tag(5)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .rotation3DEffect(
                        .degrees(rotationAngle),
                        axis: (x: 0, y: 1, z: 0)
                    )
                    .animation(.easeInOut(duration: 0.6), value: rotationAngle)
                    .onChange(of: selectedTab) { _ in
                        withAnimation(.easeInOut(duration: 0.6)) {
                            rotationAngle += 360
                        }
                    }
                    
                    // Text on top of the image
                    VStack(alignment: .leading, spacing: 10) {
                        ScrollView {
                            Text(currentText)
                                .font(.body)
                                .foregroundColor(.black)
                                .rotation3DEffect(
                                    .degrees(rotationAngle),
                                    axis: (x: 0, y: 1, z: 0)
                                )
                                .animation(.easeInOut(duration: 0.6), value: rotationAngle)
                        }
                        .frame(height: 225)
                    }
                    .padding(.horizontal, 90)
                    .offset(y: 140)
                }
                
                Spacer()
            }
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
    
    // Function to update text based on the selected tab
    private var currentText: String {
        switch selectedTab {
        case 0:
            return """
            The first pillar of faith shapes every facet of a Muslim's life and encourages Muslims to recognize Allah's presence in all actions and decisions, fostering profound humility and dependence on Him. At the heart of Islamic faith is the belief in Allah, the singular and only God. Muslims uphold the principle of Tawhid, which signifies the absolute oneness of Allah. Tawhid underscores that there is no deity but Allah, who is omnipotent, omniscient, and the sustainer of the universe.
            """
        case 1:
            return """
            The second pillar of faith in Islam is the belief in angels, or Mala’ika. These divine beings, created by Allah, execute His commands and document human actions. Muslims believe angels significantly influence their lives, from the Kiraman Katibin (the noble scribes) recording deeds to the angel Jibril (Gabriel) delivering Allah’s revelations to the Prophet Muhammad.
            """
        case 2:
            return """
            The third pillar is the the belief in divine books, or Kutub. The muslims must believe in all the sacred scriptures revealed by Allah, including the Quran, Torah, Psalms, Gospel, and others. The Quran, being the final and most comprehensive revelation, holds a special place in Islam and is regarded as the ultimate source of guidance for every aspect of life.
            """
        case 3:
            return """
            The fourth pillar in Islam is the belief in Prophets, known as Anbiya. Muslims believe that Allah has sent prophets throughout history to guide humanity. The last prophet, Muhammad, holds a distinctive and highly respected position among them. Prophets act as role models and messengers of Allah's word, guiding people towards righteousness, justice, and a deeper relationship with Allah.
            """
        case 4:
            return """
            The fifth pillar of faith is the belief in the Day of Judgment, or Qiyamah. Muslims hold that on this day, everyone will be held accountable for their actions, and their eternal destiny will be decided. This belief in Qiyamah inspires Muslims to lead righteous lives and remain mindful of their deeds, knowing they will answer to Allah on the Day of Judgment.

            """
        case 5:
            return """
            The sixth and final pillar of faith is the belief in divine decree, or Qadar. This concept holds that everything, both good and bad, is preordained by Allah’s will. Belief in Qadar cultivates resilience and trust in Allah’s wisdom, even during difficult times. It encourages Muslims to accept life’s challenges as part of Allah’s greater plan.
            """
        default:
            return ""
        }
    }
}

struct PillarView_Previews: PreviewProvider {
    static var previews: some View {
        PillarView()
    }
}
