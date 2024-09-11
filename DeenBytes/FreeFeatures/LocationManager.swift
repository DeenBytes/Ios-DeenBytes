import SwiftUI
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var userLat: Double = 0.0
    @Published var userLng: Double = 0.0
    @Published var locationName: String = ""
    @Published var isLocationAccessDenied: Bool = false
    @Published var isLocationFetched: Bool = false

    override init() {
        super.init()
        locationManager.delegate = self
        checkLocationAuthorization()
    }

    private func checkLocationAuthorization() {
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.requestLocation()
        case .denied, .restricted:
            isLocationAccessDenied = true
        @unknown default:
            print("Unknown authorization status")
        }
    }

    func getLastKnownLocation() {
        guard CLLocationManager.locationServicesEnabled() else {
            print("Location services are not enabled")
            return
        }
        let status = CLLocationManager.authorizationStatus()
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            locationManager.requestLocation()
        } else {
            checkLocationAuthorization()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            print("No locations found")
            return
        }

        userLat = location.coordinate.latitude
        userLng = location.coordinate.longitude
        reverseGeocode(location: location)
        isLocationFetched = true
        print("Location fetched: \(userLat), \(userLng)")
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get user location: \(error.localizedDescription)")
        DispatchQueue.main.async {
            self.locationName = "Failed to get location"
            self.isLocationFetched = false
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }

    private func reverseGeocode(location: CLLocation) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { [weak self] (placemarks, error) in
            if let error = error {
                print("Reverse geocoding failed: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self?.locationName = "Unable to retrieve location name"
                }
                return
            }
            
            if let placemark = placemarks?.first {
                var locationName = ""
                if let city = placemark.locality {
                    locationName += city
                }
                if let country = placemark.country {
                    locationName += ", \(country)"
                }
                DispatchQueue.main.async {
                    self?.locationName = locationName.isEmpty ? "Location Unknown" : locationName
                }
            } else {
                DispatchQueue.main.async {
                    self?.locationName = "No placemark data"
                }
            }
        }
    }
}
