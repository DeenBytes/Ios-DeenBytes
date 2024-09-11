import CoreMotion
import Combine

class SensorManager: ObservableObject {
    private let motionManager = CMMotionManager()
    @Published var currentAzimuth: Float = 0.0
    private var gravity = [Double](repeating: 0.0, count: 3)
    private var geomagnetic = [Double](repeating: 0.0, count: 3)
    private var cancellables = Set<AnyCancellable>()

    init() {
        motionManager.deviceMotionUpdateInterval = 0.1
        if motionManager.isDeviceMotionAvailable {
            motionManager.startDeviceMotionUpdates(using: .xMagneticNorthZVertical, to: .main) { [weak self] (motion, error) in
                guard let self = self, let motion = motion else { return }
                self.processMotion(motion: motion)
            }
        }
    }

    private func processMotion(motion: CMDeviceMotion) {
        gravity = [motion.gravity.x, motion.gravity.y, motion.gravity.z]
        geomagnetic = [motion.magneticField.field.x, motion.magneticField.field.y, motion.magneticField.field.z]

        let R = rotationMatrix(gravity: gravity, geomagnetic: geomagnetic)
        let orientation = getOrientation(R: R)
        let azimuth = orientation[0] * 180 / .pi
        updateQiblaDirection(azimuth: Float(azimuth))
    }

    private func rotationMatrix(gravity: [Double], geomagnetic: [Double]) -> [Double] {
        let Ax = gravity[0]
        let Ay = gravity[1]
        let Az = gravity[2]
        let Ex = geomagnetic[0]
        let Ey = geomagnetic[1]
        let Ez = geomagnetic[2]

        let Hx = Ey * Az - Ez * Ay
        let Hy = Ez * Ax - Ex * Az
        let Hz = Ex * Ay - Ey * Ax

        let normH = sqrt(Hx * Hx + Hy * Hy + Hz * Hz)
        let invH = 1.0 / normH
        let Hx_n = Hx * invH
        let Hy_n = Hy * invH
        let Hz_n = Hz * invH

        let invA = 1.0 / sqrt(Ax * Ax + Ay * Ay + Az * Az)
        let Ax_n = Ax * invA
        let Ay_n = Ay * invA
        let Az_n = Az * invA

        let Mx = Ay_n * Hz_n - Az_n * Hy_n
        let My = Az_n * Hx_n - Ax_n * Hz_n
        let Mz = Ax_n * Hy_n - Ay_n * Hx_n

        return [Hx_n, Hy_n, Hz_n, Mx, My, Mz, Ax_n, Ay_n, Az_n]
    }

    private func getOrientation(R: [Double]) -> [Double] {
        let azimuth = atan2(R[1], R[4])
        let pitch = atan(-R[7] / sqrt(R[8] * R[8] + R[6] * R[6]))
        let roll = atan2(R[6], R[8])
        return [azimuth, pitch, roll]
    }

    private func calculateQiblaDirection(lat: Double, lon: Double) -> Double {
        let MAKKAH_LATITUDE = 21.4225241
        let MAKKAH_LONGITUDE = 39.8261818

        let lat1 = lat.toRadians()
        let lon1 = lon.toRadians()
        let lat2 = MAKKAH_LATITUDE.toRadians()
        let lon2 = MAKKAH_LONGITUDE.toRadians()

        let lonDelta = lon2 - lon1
        let y = sin(lonDelta)
        let x = cos(lat1) * tan(lat2) - sin(lat1) * cos(lonDelta)
        var angle = atan2(y, x).toDegrees()
        angle = (angle + 360).truncatingRemainder(dividingBy: 360)
        return angle
    }

    private func updateQiblaDirection(azimuth: Float) {
        let locationManager = LocationManager()
        let coordinates = (locationManager.userLat, locationManager.userLng)
        let qiblaDirection = calculateQiblaDirection(lat: coordinates.0, lon: coordinates.1)
        let adjustedQiblaDirection = (qiblaDirection - Double(azimuth) + 270).truncatingRemainder(dividingBy: 360)
        currentAzimuth = Float(adjustedQiblaDirection)
    }
}

extension Double {
    func toRadians() -> Double {
        return self * .pi / 180
    }

    func toDegrees() -> Double {
        return self * 180 / .pi
    }
}
