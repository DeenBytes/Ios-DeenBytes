import SwiftUI


@main
struct DeenBytesApp: App {

    
var body: some Scene {
        WindowGroup {
            SignUpView()
        }
    }
}




struct CurvedShape: Shape {
    func path(in rect: CGRect) -> Path {
        let radius: CGFloat = 25.0 // Adjust the radius to your preference
        var path = Path()

        // Start at the top-left corner
        path.move(to: CGPoint(x: 0, y: 0))
        
        // Draw a straight line to the top-right corner
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        
        // Draw a straight line down to the bottom-right corner with radius
        path.addLine(to: CGPoint(x: rect.width, y: rect.height - radius))
        path.addArc(center: CGPoint(x: rect.width - radius, y: rect.height - radius), radius: radius, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: false)
        
        
        // Add bottom-left corner radius
        path.addArc(center: CGPoint(x: radius, y: rect.height - radius), radius: radius, startAngle: .degrees(90), endAngle: .degrees(180), clockwise: false)
        
        // Close the path
        path.addLine(to: CGPoint(x: 0, y: 0))
        
        return path
    }
}


struct CurvedShapeNew: Shape {
    func path(in rect: CGRect) -> Path {
        let radius: CGFloat = 25.0 // Adjust the radius to your preference
        var path = Path()

        // Start at the bottom-left corner
        path.move(to: CGPoint(x: 0, y: rect.height))

        // Draw a straight line to the bottom-right corner
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))

        // Draw a straight line up to the top-right corner
        path.addLine(to: CGPoint(x: rect.width, y: radius))

        // Add top-right corner radius
        path.addArc(center: CGPoint(x: rect.width - radius, y: radius), radius: radius, startAngle: .degrees(0), endAngle: .degrees(270), clockwise: true)

        // Draw a straight line to the top-left corner
        path.addLine(to: CGPoint(x: radius, y: 0))

        // Add top-left corner radius
        path.addArc(center: CGPoint(x: radius, y: radius), radius: radius, startAngle: .degrees(270), endAngle: .degrees(180), clockwise: true)

        // Close the path
        path.addLine(to: CGPoint(x: 0, y: rect.height))

        return path
    }
}


