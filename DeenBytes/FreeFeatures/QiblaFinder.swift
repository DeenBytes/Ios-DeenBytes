import SwiftUI
import CoreLocation

struct QiblaFinder: View {
    @ObservedObject var locationManager = LocationManager()
    @ObservedObject var sensorManager = SensorManager()
    @State private var selectedCompass: String = "compass1"

    var body: some View {
        VStack {
            if locationManager.isLocationAccessDenied {
                Text("Location access is denied. Please enable location services in settings.")
                    .font(.headline)
                    .foregroundColor(.red)
                    .padding()
            } else {
                ScrollView {
                    ZStack(alignment: .top) {
                        Image("qiblaBack")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 300)
                            .clipped()
                        
                        HStack {
//                            Button(action: {
//                                // Back button action
//                            }) {
//                                Image(systemName: "chevron.left")
//                                    .font(.title)
//                                    .foregroundColor(.black)
//                            }
                            Spacer()
                            Text("Qibla Finder")
                                .font(.headline)
                                .bold()
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "ellipsis")
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                        .padding(.horizontal, 40)
                        .padding(.top, 60)
                    }

                    VStack(alignment: .leading) {
                        HStack {
                            Text(locationManager.locationName)
                                .font(.title2)
                                .fontWeight(.bold)
                        }

                        Text("Islamic University, Karachi (18.0°/18.0°)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 24)
                    .offset(y: -150)

                    HStack {
                        Text("Dhuhr 12:18 pm")
                            .font(.headline)
                            .foregroundColor(.black)
                        Spacer()
                        Text("Time Left\n1h, 28m and 48s")
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.trailing)
                    }
                    .padding()
                    .background(LinearGradient(
                        gradient: Gradient(colors: [Color(hex: "#FFE27A"), Color(hex: "#F4983A")]),
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                    .cornerRadius(16)
                    .offset(y: -125)
                    .padding(.horizontal, 32)

                    ZStack {
                        Image(selectedCompass)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 250)
                            .rotationEffect(.degrees(Double(sensorManager.currentAzimuth)))
                            .offset(y: -60)

                        Image("qiblaIcon")
                            .resizable()
                            .frame(width: 17, height: 35)
                            .offset(y: -210)
                    }

                    Text("You’re now facing Mecca")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .offset(y: -40)

                    Spacer()

                    VStack {
                        Text("Choose Compass")
                            .font(.headline)
                            .bold()
                            .foregroundColor(.black)
                            .offset(y: -30)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(1..<7) { index in
                                    Image("compass\(index)")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .padding(5)
                                        .onTapGesture {
                                            selectedCompass = "compass\(index)"
                                        }
                                }
                            }
                        }
                        .padding()
                        .background(Color.yellow.opacity(0.3))
                        .cornerRadius(16)
                        .offset(y: -30)
                        .padding(.horizontal)
                    }

                    Spacer()
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            locationManager.getLastKnownLocation()
        }
    }
}




struct QiblaFinder_Previews: PreviewProvider {
    static var previews: some View {
        QiblaFinder()
    }
}
