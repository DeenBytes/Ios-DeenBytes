import SwiftUI

struct PrayerTimeSettingsView: View {
    @State private var fajarTimeAdjust: Int = 15
    @State private var selectedAlarm: AlarmType = .vibration
    
    enum AlarmType: String, CaseIterable, Identifiable {
        case adhan, beep, vibration, mute
        
        var id: String { self.rawValue }
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    // Top section with location and date
                    ZStack(alignment: .top) {
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
                                Button(action: {
                                    // Handle back action
                                }) {
                                    Image(systemName: "chevron.left")
                                        .font(.title)
                                        .foregroundColor(.black)
                                }
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
                            .padding(.horizontal, 24)
                            .padding(.top, 50)
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Gautam Buddha Nagar")
                                        .font(.headline)
                                        .padding(.leading, 8)
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                }
                                .padding(.horizontal)
                                .padding(.top, 24)
                            }
                        }
                    }
                    
                    // Prayer Settings
                    Form {
                        Section(header: Text("Prayer Settings")) {
                            HStack {
                                Text("Fajar\nTime Adjustable")
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .multilineTextAlignment(.leading)
                                
                                Stepper(value: $fajarTimeAdjust, in: 0...60, step: 1) {
                                    Text("\(fajarTimeAdjust) seconds")
                                }
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                            }
                        }
                        
                        // Alarm Settings
                        Section(header: Text("Alarm Settings")) {
                            ForEach(AlarmType.allCases) { alarm in
                                HStack {
                                    Image(systemName: alarm == .adhan ? "speaker.2.fill" : alarm == .beep ? "dot.circle" : alarm == .vibration ? "iphone.radiowaves.left.and.right" : "speaker.slash.fill")
                                    Text(alarm.rawValue.capitalized)
                                    Spacer()
                                    if selectedAlarm == alarm {
                                        Image(systemName: "checkmark")
                                    }
                                }
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selectedAlarm = alarm
                                }
                            }
                        }
                    }
                    .frame(maxHeight: 300)
                    
                    // Buttons
                    HStack {
                        Button(action: {
                            // Cancel action
                        }) {
                            Text("Cancel")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding()
                                .background(Color(.systemGray5))
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            // Save action
                        }) {
                            Text("Save")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                }
            }
                    }
        
    }
}

struct PrayerTimeSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        PrayerTimeSettingsView()
    }
}
