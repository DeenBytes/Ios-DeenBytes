import SwiftUI

struct LocationFetcherView: View {
    @ObservedObject var locationManager = LocationManager()
    @State private var isLocationFetched = false

    var body: some View {
        Group {
            if locationManager.isLocationFetched {
                QiblaFinder()
            } else {
                VStack {
                    Text("Fetching Location...")
                        .font(.headline)
                        .padding()
                    
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
                .onAppear {
                    locationManager.getLastKnownLocation()
                }
            }
        }
    }
}

struct LocationFetcherView_Previews: PreviewProvider {
    static var previews: some View {
        LocationFetcherView()
    }
}
