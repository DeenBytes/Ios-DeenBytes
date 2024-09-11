import SwiftUI

struct PrayerTrackingView: View {
    @State private var selectedDate = Date()
    @State private var prayers = [
        Prayer(name: "Fajar", time: "04:00 AM", checked: true),
        Prayer(name: "Sunrise", time: "05:30 AM", checked: false),
        Prayer(name: "Dhuhr", time: "12:30 PM", checked: false),
        Prayer(name: "Asr", time: "03:45 PM", checked: false),
        Prayer(name: "Maghrib", time: "06:30 PM", checked: false),
        Prayer(name: "Isha", time: "08:00 PM", checked: false)
    ]
    @State private var isPrayingTabSelected = true
    
    var body: some View {
        ScrollView {
                  VStack {
                
                    ZStack(alignment: .top) {
                        GeometryReader { geometry in
                            Image("prayer")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 300)
                                .clipped()
                                .clipShape(CurvedShape())
                            
                            DatePicker("", selection: $selectedDate, displayedComponents: .date)
                                .datePickerStyle(GraphicalDatePickerStyle())
                                .labelsHidden()
                                .background(Color.white)
                                .cornerRadius(24)
                                .shadow(radius: 5)
                                .padding(.horizontal, 16)
                                .offset(y: geometry.size.height * 0.80)
                        }
                        .frame(height: 300)
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Button(action: {
                                    // Handle back action
                                }) {
                                    Image(systemName: "chevron.left")
                                        .font(.title)
                                        .foregroundColor(.black)
                                }
                                Spacer()
                                Text("Prayer Tracking")
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
                            .padding(.horizontal, 24)
                            .padding(.top,50)
                            
                            
                            VStack(alignment: .leading) {
                                Text("Wednesday 22 May 2024")
                                    .font(.headline)

                                    .foregroundColor(.black)

                                
                                Text("14 Thul Qa’dah, 1445")
                                    .font(.subheadline)

                                    .foregroundColor(.black)
                                
                            }
                            .padding(.leading,8)
                            .padding(.top, 24)
                        }
                       
                    }
                    
                    VStack(spacing: 6) {
                        HStack {
                            Button(action: {
                                isPrayingTabSelected = true
                            }) {
                                Text("Praying")
                                    .font(.headline)
                                    .foregroundColor(isPrayingTabSelected ? .white : .black)
                                    .padding(.horizontal, 24)
                                    .padding(.vertical, 6)
                                    .background(isPrayingTabSelected ? Color.green : Color.gray.opacity(0.2))
                                    .cornerRadius(24)
                            }
                            Button(action: {
                                isPrayingTabSelected = false
                            }) {
                                Text("Fasting")
                                    .font(.headline)
                                    .foregroundColor(isPrayingTabSelected ? .black : .white)
                                    .padding(.horizontal, 24)
                                    .padding(.vertical, 6)
                                    .background(isPrayingTabSelected ? Color.gray.opacity(0.2) : Color.green)
                                    .cornerRadius(24)
                            }
                        }
                        .padding(.horizontal, 6)
                        .padding(.top, 12)
                        
                        if isPrayingTabSelected {
                            PrayingView(prayers: $prayers)
                        } else {
                            FastingView()
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(24)
                    .offset(y:300)
                    .shadow(radius: 5)
                    .padding(.horizontal, 16)
                    .padding(.top, 12)
                }
            }
            .background(Color.cutomGreen)
            .edgesIgnoringSafeArea(.all)
                
        }
        
    }
    
    struct PrayingView: View {
        @Binding var prayers: [Prayer]
        
        var body: some View {
            VStack(spacing: 8) {
                ForEach($prayers) { $prayer in
                    HStack {
                        Text(prayer.name)
                            .font(.headline)
                            .padding(.leading, 8)
                        Spacer()
                        Image(systemName: prayer.checked ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(prayer.checked ? .green : .gray)
                            .onTapGesture {
                                prayer.checked.toggle()
                            }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 4)
                }
            }
        }
    }
    
    struct FastingView: View {
        var body: some View {
            VStack(spacing: 8) {
                
                ZStack{
                    Image("prayTrack")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 100)
                        .clipped()
                        .clipShape(CurvedShapeNew())
                    
                    Text("Did you fast on this day?")
                        .font(.headline)
                        .padding(.leading,24)
                       
                    
                }
                
                  
            }
            .cornerRadius(10)
            .shadow(radius: 5)
          
        }
    }
    
    struct Prayer: Identifiable {
        let id = UUID()
        let name: String
        let time: String
        var checked: Bool
    }

    struct PrayerTrackingView_Previews: PreviewProvider {
        static var previews: some View {
            PrayerTrackingView()
        }
    }

