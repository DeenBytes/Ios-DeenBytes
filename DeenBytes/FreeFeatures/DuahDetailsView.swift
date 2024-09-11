import SwiftUI

struct DuahDetailsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                HStack {
                    Button(action: {
                        // Action for back button
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Text("Dua")
                        .font(.title2)
                        .foregroundColor(.black)
                    Spacer()
                    Button(action: {
                        // Action for bell button
                    }) {
                        Image(systemName: "bell.fill")
                            .foregroundColor(.black)
                    }
                }
                .padding()
                
                // Main content
                VStack() {
                    // Image
                    Image("duaview")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipShape(CurvedShape())
                        .clipped()
                    
                    // Section Header
                    Text("When waking up")
                        .font(.title2)
                        .padding()
                        .offset(y:-120)
                    
                    // Dua Section
                    VStack(spacing: 10) {
                        DuaSectionView(title: "Upon experience unrest, fear apprehensiveness during sleep",
                                       arabicText: """
                                       اللّهُمَّ لَكَ الْحَمْدُ أَنْتَ كَسَوْتَنِيهِ، أَسْأَلُكَ مِنْ خَيْرِهِ وَخَيْرِ مَا صُنِعَ لَهُ، وَأَعُوذُ بِكَ مِنْ شَرِّهِ وَشَرِّ مَا صُنِعَ لَهُ
                                       """,
                                       transliteration: """
                                       Allahumma laka-l-hamdu Anta kasawtaneeh, as'aluka min khayrihi wa khayri ma suni'a lah, wa a'udhu bika min sharrihi wa sharri ma suni'a lah.
                                       """,
                                       translation: "O Allah, all praise is for You Alone — You have clothed me with it. I"
                        )
                        DuaSectionView(title: "Upon experience unrest, fear apprehensiveness during sleep",
                                       arabicText: """
                                       اللّهُمَّ لَكَ الْحَمْدُ أَنْتَ كَسَوْتَنِيهِ، أَسْأَلُكَ مِنْ خَيْرِهِ وَخَيْرِ مَا صُنِعَ لَهُ، وَأَعُوذُ بِكَ مِنْ شَرِّهِ وَشَرِّ مَا صُنِعَ لَهُ
                                       """,
                                       transliteration: """
                                       Allahumma laka-l-hamdu Anta kasawtaneeh, as'aluka min khayrihi wa khayri ma suni'a lah, wa a'udhu bika min sharrihi wa sharri ma suni'a lah.
                                       """,
                                       translation: "O Allah, all praise is for You Alone — You have clothed me with it. I"
                        )
                        DuaSectionView(title: "Upon experience unrest, fear apprehensiveness during sleep",
                                       arabicText: """
                                       اللّهُمَّ لَكَ الْحَمْدُ أَنْتَ كَسَوْتَنِيهِ، أَسْأَلُكَ مِنْ خَيْرِهِ وَخَيْرِ مَا صُنِعَ لَهُ، وَأَعُوذُ بِكَ مِنْ شَرِّهِ وَشَرِّ مَا صُنِعَ لَهُ
                                       """,
                                       transliteration: """
                                       Allahumma laka-l-hamdu Anta kasawtaneeh, as'aluka min khayrihi wa khayri ma suni'a lah, wa a'udhu bika min sharrihi wa sharri ma suni'a lah.
                                       """,
                                       translation: "O Allah, all praise is for You Alone — You have clothed me with it. I"
                        )
                    }
                    .offset(y:-100)
                }
                .padding()
            }
        }
    }
}

struct DuaSectionView: View {
    var title: String
    var arabicText: String
    var transliteration: String
    var translation: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue.opacity(0.2))
                .cornerRadius(24)
                .fixedSize(horizontal: false, vertical: true)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color.blue.opacity(0.2), lineWidth: 0)
                )
               
            Text(arabicText)
                .font(.body)
                .multilineTextAlignment(.leading)
                .padding(.top, 24)
            
            Text(transliteration)
                .font(.body)
                .multilineTextAlignment(.leading)
                .padding(.top, 32)
            
            Text(translation)
                .font(.body)
                .multilineTextAlignment(.leading)
                .foregroundColor(.gray)
                .padding(.top, 12)
            
            HStack {
                Button(action: {
                    // Play button action
                }) {
                    Image(systemName: "play.circle")
                        .font(.title)
                        .padding(.trailing, 10)
                }
                
                Spacer()
                
                Button(action: {
                    // Share button action
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.title)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
               .background(Color.white)
               .cornerRadius(24)
               .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
               .padding(.horizontal, 6)
    }
}

struct DuahDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DuahDetailsView()
    }
}
