import SwiftUI

// Extension for Color to initialize with hex values
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct PrayerTimeView: View {
    var body: some View {
        VStack {
            ScrollView{
            // Top section with location and date
            ZStack(alignment:.top) {
                // Background image
                Image("prayer")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300)
                    .clipped()
                    .clipShape(CurvedShape())
                
       
                    // Header overlapping the background image
                    VStack {
                        HStack {
//                            Button(action: {
//                                // Handle back action
//                            }) {
//                                Image(systemName: "chevron.left")
//                                    .font(.title)
//                                    .foregroundColor(.black)
//                            }
                            Spacer()
                            Text("Prayer Times")
                                .font(.title2)
                                .bold()
                            Spacer()
                            Button(action: {
                                // Handle settings action
                            }) {
                                Image(systemName: "ellipsis")
                                    .font(.title)
                                    .foregroundColor(.black)
                            }
                        }
                        
                        .padding(.horizontal,24)
                        .padding(.top,60)
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Gautam Buddha Nagar")
                                    .font(.headline)
                                    .padding(.leading, 8)
                                    .foregroundColor(.black)
                                
                         
                                Spacer()
                            }
                            .padding(.horizontal)
                            
                            Text("Islamic University, Karachi (18.0º/18.0º)")
                                .font(.caption)
                                .padding(.leading, 8)
                                .foregroundColor(.black)
                                .padding(.horizontal)
                                .padding(.bottom, 12)
                            
                            Text("Wednesday 22 May 2024")
                                .font(.headline)
                                .padding(.leading, 8)
                                .foregroundColor(.black)
                                .padding(.horizontal)
                            
                            Text("14 Thul Qa’dah, 1445")
                                .font(.subheadline)
                                .padding(.leading, 8)
                                .foregroundColor(.black)
                                .padding(.horizontal)
                        }
                        .padding(.top, 24) // Adjust top padding to move content up
                    }
                }
                
                
                // Prayer times section
                VStack(alignment: .trailing) {
                    HStack {
                        Text("Dhuhr 12:18 pm")
                            .font(.title3)
                            .padding(.top,12)
                        
                        Spacer()
                        VStack{
                            Text("Time Left")
                                .font(.caption)
                                .padding(.trailing,12)
                                .padding(.top,24)
                            
                            
                            Text("1h, 28m and 48s")
                                .font(.caption)
                                .padding(.trailing,12)
                            
                            
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom,16)
                    .background(  LinearGradient(
                        gradient: Gradient(colors: [Color(hex: "#ADCA92"), Color(hex: "#1E4538")]),
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                    
                    
                    
                    ForEach(prayerTimes, id: \.self) { time in
                        HStack {
                            Image(systemName: time.icon)
                            Text(time.name)
                            Spacer()
                            Text(time.time)
                            Image("settings")
                                .padding(.horizontal,12)
                            
                        }
                        .padding(.horizontal)
                        .padding(.vertical,12)
                    }
                }
                .background(Color.white)
                .cornerRadius(24)
                .shadow(radius: 5)
                .padding(.horizontal, 24)
                .offset(y: -50) // Adjust vertical offset to move section up
                
                // Prayer tracking section
                VStack(alignment: .leading) {
                    HStack {
                        Text("Prayer Tracking")
                            .font(.headline)
                            .padding(.top)
                        Spacer()
                        Image(systemName: "calendar")
                            .padding(.top)
                    }
                    .background(Color.white)
                    .padding(.horizontal,24)
                    
                    
                    HStack {
                        ForEach(0..<7) { _ in
                            CircularProgressBar(progress: 0.3)
                        }
                    }
                    .padding(.vertical, 16)
                    .padding(.horizontal)
                }
                .background(Color.white)
                .cornerRadius(24)
                .shadow(radius: 5)
                .padding(.horizontal,24)
                .offset(y:-30)
                
                Spacer()
            }
            .background(Color.cutomGreen)
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    struct CircularProgressBar: View {
        var progress: CGFloat
        
        var body: some View {
            ZStack {
                Circle()
                    .stroke(lineWidth: 5.0)
                    .opacity(0.3)
                    .foregroundColor(Color.primaryGreen)
                
                Circle()
                    .trim(from: 0.0, to: progress)
                    .stroke(style: StrokeStyle(lineWidth: 5.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.primaryGreen)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear, value: progress)
            }
            .frame(width: 40, height: 40)
        }
    }
    
    struct PrayerTime: Hashable {
        var icon: String
        var name: String
        var time: String
    }
    
    let prayerTimes = [
        PrayerTime(icon: "sunrise.fill", name: "Fajar", time: "03:56 am"),
        PrayerTime(icon: "sun.max.fill", name: "Sunrise", time: "03:56 am"),
        PrayerTime(icon: "sun.max.fill", name: "Dhuhr", time: "03:56 am"),
        PrayerTime(icon: "sun.min.fill", name: "Asr", time: "03:56 am"),
        PrayerTime(icon: "sunset.fill", name: "Maghrib", time: "03:56 am"),
        PrayerTime(icon: "moon.fill", name: "Isha", time: "03:56 am")
    ]
    
    
    struct PrayerTimeView_Previews: PreviewProvider {
        static var previews: some View {
            PrayerTimeView()
        }
    }

}
