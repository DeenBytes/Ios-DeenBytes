import SwiftUI

struct HomepageView: View {
    
    @StateObject private var viewModel = HomepageViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ZStack(alignment: .top) {
                        // Background image
                        Image("homepageImage")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 300)
                            .clipped()
                            .clipShape(CurvedShape())
                        
                        // Header
                        HStack(alignment:.center) {
                            Spacer()
                            Text("Assalamualaikum, Abdul")
                                .font(.headline)
                                .padding(.top, 60)
                            Spacer()
                            Image(systemName: "bell.fill")
                                .foregroundColor(.black)
                                .padding(.top, 60)
                        }
                        .padding(.horizontal, 65)
                    }
                    
                    // Prayer times section
                                   NavigationLink(destination: PrayerTimeView()) {
                                       VStack(alignment: .trailing) {
                                           HStack {
                                               Text("Dhuhr 12:18 pm")
                                                   .font(.title3)
                                                   .padding(.top, 12)
                                               
                                               Spacer()
                                               VStack {
                                                   Text("Time Left")
                                                       .font(.caption)
                                                       .padding(.trailing, 12)
                                                       .padding(.top, 20)
                                                   
                                                   Text("1h, 28m and 48s")
                                                       .font(.caption)
                                                       .padding(.trailing, 12)
                                               }
                                           }
                                           .padding(.horizontal)
                                           .padding(.bottom, 16)
                                           .background(
                                               LinearGradient(
                                                   gradient: Gradient(colors: [Color(hex: "#DCFFE7"), Color(hex: "#35887B")]),
                                                   startPoint: .top,
                                                   endPoint: .bottom
                                               )
                                           )
                                       }
                                       .background(Color.white)
                                       .cornerRadius(24)
                                       .shadow(radius: 5)
                                       .padding(.horizontal, 60)
                                       .offset(y: -50) // Adjust vertical offset to move section up
                                   }
                                   .buttonStyle(PlainButtonStyle())
                    // Buttons
                    HStack {
                        Button(action: {
                            viewModel.navigateTo("MosqueFinderView")
                        })
                        {
                            HStack {
                                Image(systemName: "location.fill")
                                    .foregroundColor(.black)
                                Text("Nearby Mosque")
                                    .foregroundColor(.black)
                            }
                            .padding()
                            .background(Color(hex: "#E4FFFB"))
                            .cornerRadius(24)
                            .overlay(
                                RoundedRectangle(cornerRadius: 24)
                                    .stroke(Color(hex: "#8CC5AA"), lineWidth: 1)
                            )
                        }
                        Button(action: {
                            viewModel.navigateTo("QiblaFinder")
                        }) {
                            HStack {
                                Image(systemName: "map.fill")
                                    .foregroundColor(.black)
                                Text("Find Direction")
                                    .foregroundColor(.black)
                            }
                            .padding()
                            .background(Color(hex: "#E4FFFB"))
                            .cornerRadius(24)
                            .overlay(
                                RoundedRectangle(cornerRadius: 24)
                                    .stroke(Color(hex: "#8CC5AA"), lineWidth: 1)
                            )
                        }
                    }
                    .padding(.horizontal, 20)
                    .offset(y: -40)
                    
                    // Banner
                    VStack(alignment: .leading) {
                        // Background image
                        Image("homeBanner")
                            .resizable()
                            .clipped()
                    }
                    .padding(.horizontal, 55)
                    .cornerRadius(24)
                    .offset(y: -30)
                    
                    // Features
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Features")
                                .font(.headline)
                            Spacer()
                            Button(action: {
                                viewModel.navigateTo("AllFeaturesView")
                            }) {
                                Text("View all")
                                    .foregroundColor(.blue)
                            }
                        }
                        
                        HStack {
                            FeatureIconView(name: "Allah Names", image: "99nameshome") {
                                viewModel.selectedView = "Prayer"
                            }
                            FeatureIconView(name: "Live Makkah", image: "makkahhome") {
                                viewModel.selectedView = "Qibla"
                            }
                            FeatureIconView(name: "Tasbih Beads", image: "tasbihhome") {
                                viewModel.selectedView = "Tasbih"
                            }
                            FeatureIconView(name: "Zakat Calculate", image: "zakkathome") {
                                viewModel.selectedView = "Makkah"
                            }
                        }
                                            
                                         
                        
                    }
                    .padding(.horizontal, 60)
                    .offset(y: -20)
                    
                    VStack(alignment: .leading) {
                        // Quran Completion
                        QuranCompletionView()
                            .padding(.horizontal, 60)
                        
                        // Hadith of the Day
                        HadithOfTheDayView()
                            .padding(.horizontal, 60)
                            .padding(.vertical, 12)
                        
                        Spacer()
                    }
                }.toolbar {
                                ToolbarItem(placement: .bottomBar) {
                                    BottomNavigationBar()
                                }
                            }
            }.edgesIgnoringSafeArea(.all)
                .background(
                                NavigationLink(destination: MosqueFinderView(), tag: "MosqueFinderView", selection: $viewModel.selectedView) {
                                    EmptyView()
                            }
                    )
                    .background(
                                NavigationLink(destination: QiblaFinder(), tag: "QiblaFinder", selection: $viewModel.selectedView) {
                                    EmptyView()
                            }
                    )
                    .background(
                                    NavigationLink(
                                        destination: AllahNamesView(),  // Replace with actual destination view
                                        tag: "Prayer",
                                        selection: $viewModel.selectedView
                                    ) {
                                        EmptyView()
                                    }
                                )
                                .background(
                                    NavigationLink(
                                        destination: LiveMakkahView(),  // Replace with actual destination view
                                        tag: "Qibla",
                                        selection: $viewModel.selectedView
                                    ) {
                                        EmptyView()
                                    }
                                )
                                .background(
                                    NavigationLink(
                                        destination: TasbihView(),  // Replace with actual destination view
                                        tag: "Tasbih",
                                        selection: $viewModel.selectedView
                                    ) {
                                        EmptyView()
                                    }
                                )
                                .background(
                                    NavigationLink(
                                        destination: ZakkatView(),  // Replace with actual destination view
                                        tag: "Makkah",
                                        selection: $viewModel.selectedView
                                    ) {
                                        EmptyView()
                                    }
                                )
                                .background(
                                    NavigationLink(
                                        destination: AllFeaturesView(),  // Replace with actual destination view
                                        tag: "AllFeaturesView",
                                        selection: $viewModel.selectedView
                                    ) {
                                        EmptyView()
                                    }
                                )
        }
    }
}
struct FeatureIconView: View {
    let name: String
    let image: String
    let action: () -> Void  // Closure for the tap action
    
    var body: some View {
        Button(action: action) {
            VStack {
                Image(image)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding(.horizontal, 8)
                    .background(Color(hex: "#E4FFFB"))
                    .cornerRadius(24)
                Text(name)
                    .font(.caption)
                    .foregroundColor(.black)
            }
            .padding()
            .background(Color(hex: "#E4FFFB"))
            .cornerRadius(24)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color(hex: "#8CC5AA"), lineWidth: 1)
            )
        }
    }
}


struct BottomNavigationBar: View {
    var body: some View {
        HStack {
            BottomNavItem(icon: "house.fill", label: "Home")
            BottomNavItem(icon: "video.fill", label: "Live Session")
            BottomNavItem(icon: "book.fill", label: "Community")
            BottomNavItem(icon: "person.fill", label: "Kids Mode")
        }
    }
}

struct QuranCompletionView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Quran Completion")
                .font(.headline)
            
            Text("Last read Al-Baqarah 117")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 24)
            
            ProgressView(value: 0.5)
                .accentColor(.green)
                .scaleEffect(x: 1, y: 2, anchor: .center)
                .cornerRadius(24)
                .padding(.trailing, 150)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(24)
        .shadow(radius: 2)
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color(hex: "#8CC5AA"), lineWidth: 1)
        )
    }
}

struct HadithOfTheDayView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Hadith of the Day")
                .font(.headline)
            
            Text("عَنْ عُمَرَ رَضِيَ اللَّهُ عَنْهُ قَالَ: سَمِعْتُ رَسُولَ اللَّهِ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ يَقُولُ\nلَوْ أَنَّكُمْ تَوَكَّلُونَ عَلَى اللَّهِ حَقَّ تَوَكُّلِهِ لَرَزَقَكُمْ كَمَا يَرْزُقُ الطَّيْرَ ، تَغْدُو خِمَاصًا وَتَرُوحُ بِطَانًا\nرَوَاهُ التِّرْمِذِيُّ ، وَقَالَ حَدِيثٌ حَسَنٌ صَحِيحٌ")
                .font(.body)
                .foregroundColor(.gray)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
            
//            HStack {
//                Spacer()
//                Button(action: {
//                    // Action for previous Hadith
//                }) {
//                    Image(systemName: "chevron.left")
//                        .padding()
//                        .background(Color.green.opacity(0.1))
//                        .cornerRadius(24)
//                }
//                
//                Button(action: {
//                    // Action for next Hadith
//                }) {
//                    Image(systemName: "chevron.right")
//                        .padding()
//                        .background(Color.green.opacity(0.1))
//                        .cornerRadius(24)
//                }
//            }
        }
        .padding(.vertical,12)
        .padding(.horizontal,24)
        .background(Color.white)
        .cornerRadius(24)
        .shadow(radius: 2)
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color(hex: "#8CC5AA"), lineWidth: 1)
        )
    }
}

struct BottomNavItem: View {
    let icon: String
    let label: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
            Text(label)
                .font(.caption)
        }
        .frame(maxWidth: .infinity)
        .background(
                  RoundedCornersShape(cornerRadius: 30, corners: [.topLeft, .topRight])
                    .fill(.primaryGreen) // Use the passed background color
              )
       
    }
}

// Custom shape for rounded corners
struct RoundedCornersShape: Shape {
    var cornerRadius: CGFloat = 25.0
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        return Path(path.cgPath)
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}
