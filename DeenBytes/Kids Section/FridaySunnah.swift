import SwiftUI

struct FridaySunnahView: View {
    var body: some View {
        VStack {
            // Header Section
            HStack {
                Button(action: {
                    // Action for back button
                }) {
                    Image("back")
                        .resizable()
                        .frame(width: 34, height: 26)
                }
                
                Spacer()
                
                Image("fridaySunnah")
                    .resizable()
                    .frame(width: 250, height: 30)
                
                Spacer()
            }
            .padding(.top, 60)
            .padding(.horizontal)
            
            ScrollView {
                VStack(spacing: 8) {
                    SunnahCard(imageName: "onefs")
                    SunnahCard(imageName: "secondfs")
                    SunnahCard(imageName: "threefs")
                    SunnahCard(imageName: "fourfs")
                    SunnahCard(imageName: "fivefs")
                    SunnahCard(imageName: "sixfs")
                    SunnahCard(imageName: "sevenfs")
                    SunnahCard(imageName: "eightfs")
                    SunnahCard(imageName: "ninefs")
                    SunnahCard(imageName: "tenfs")
                    SunnahCard(imageName: "elevenfs")
                }
                .padding(.top)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct SunnahCard: View {
    var imageName: String
    @State private var floatingOffset: CGFloat = 0.0
    @State private var rotation: Double = 0
    @State private var scale: CGFloat = 0.9
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaleEffect(scale)
                .offset(y: floatingOffset)
                .onAppear {
                    startFloatingAnimation()
                }
                .padding()
        }
    }
    
    func startFloatingAnimation() {
        // Floating effect
        withAnimation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
            floatingOffset = -15 // Move the image up and down
        }
        
    
        
        // Scale effect (Zoom in and out)
        withAnimation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
            scale = 1.1 // Slight zoom in and out
        }
    }
}

struct FridaySunnahView_Previews: PreviewProvider {
    static var previews: some View {
        FridaySunnahView()
    }
}
