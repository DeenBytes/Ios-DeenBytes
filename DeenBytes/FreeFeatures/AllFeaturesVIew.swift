import SwiftUI

struct AllFeaturesView: View {
    let features = [
        ("Prayer", "prayerhome"),
        ("Qibla", "qiblahome"),
        ("Tasbih", "tasbihhome"),
        ("Makkah Live", "makkahhome"),
        ("Find Mosque", "findmosquehome"),
        ("Duas", "duahome"),
        ("Calendar", "calenderhome"),
        ("Zakat", "zakkathome"),
        ("99 Names", "99nameshome"),
        ("Quran", "quranhome")
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack{
            ScrollView {
                HStack {
                    Spacer()
                    Text("All Features")
                        .font(.headline)
                        .bold()
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "ellipsis")
                        .font(.title)
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 24)
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(features, id: \.0) { feature in
                        ZStack {
                            VStack {
                                HStack {
                                    Text(feature.0)
                                        .font(.headline)
                                        .padding([.leading, .top], 10)
                                    Spacer()
                                }
                                Spacer()
                                HStack {
                                    Spacer()
                                    Image(feature.1)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                        .padding([.trailing, .bottom], 10)
                                }
                            }
                        }
                        .frame(width: 150, height: 150) // Set fixed dimensions for each box
                        .background(Color.white)
                        .cornerRadius(24)
                        .shadow(radius: 3)
                    }
                }
                .padding()
            }
        }
    }
}

struct AllFeaturesView_Previews: PreviewProvider {
    static var previews: some View {
        AllFeaturesView()
    }
}
