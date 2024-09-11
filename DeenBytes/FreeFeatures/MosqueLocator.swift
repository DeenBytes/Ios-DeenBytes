import SwiftUI
import MapKit

struct MosqueFinderView: View {
    // A region for your map view
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 28.6139, longitude: 77.2090), // Example: New Delhi
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    // Sample mosque data
    let mosques = [
        "Jama Masjid, Indirapuram",
        "Jama Masjid, Indirapuram",
        "Jama Masjid, Indirapuram",
        "Jama Masjid, Indirapuram"
    ]
    
    var body: some View {
        VStack {
            
            HeaderViewMosque()
            
            // Map View
            Map(coordinateRegion: $region)
                .frame(height: 300)
            
            // Mosque list header
            Text("Nearby Mosques")
                .font(.headline)
                .padding()
                .background(Color.green.opacity(0.1))
                .cornerRadius(24)
                .padding(.vertical,12)
            
            // List of mosques
            List(mosques.indices, id: \.self) { index in
                HStack {
                    // Icon
                    Image(systemName: "location.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.green)
                    
                    VStack(alignment: .leading) {
                        Text(mosques[index])
                            .font(.body)
                        Text("Gyan Khand 3, Indirapuram")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Text("4.1 Km")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.green.opacity(0.1))
                .cornerRadius(24)
            }
            .background(Color.white)
            .cornerRadius(24)
            
        }
        .edgesIgnoringSafeArea(.all)
    
    }
}

struct HeaderViewMosque: View {
    var body: some View {
        HStack() {
            Spacer()
            Text("Mosque Locator")
                .font(.headline)
                .bold()
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "ellipsis")
                .font(.headline)
                .foregroundColor(.black)
     
        }
        .padding(.top, 65)
        .padding(.leading)
        .padding(.horizontal, 24)
        .padding(.bottom,12)
        .background(Color.white)
        .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 2)
    }
}

struct MosqueFinderView_Previews: PreviewProvider {
    static var previews: some View {
        MosqueFinderView()
    }
}

