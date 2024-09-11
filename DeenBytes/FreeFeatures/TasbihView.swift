import SwiftUI

struct Bead: Identifiable {
    let id = UUID()
    var angle: Double
    var position: CGPoint
    var image: String
}

struct Card: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let image: String
}

struct TasbihView: View {
    @State private var beads: [Bead] = []
    @State private var selectedBeadIndex: Int? = nil
    @State private var selectedBeads: String = "bead1"
    
    let totalBeads = 7
    let beadRadius: CGFloat = 30
    let circleRadius: CGFloat = 335
    
    let leftBeadsCount = 4
    let rightBeadsCount = 3
    
    let cards: [Card] = [
        Card(title: "Card 1", subtitle: "This is the first card", image: "exampleImage1"),
        Card(title: "Card 2", subtitle: "This is the second card", image: "exampleImage2"),
        Card(title: "Card 3", subtitle: "This is the third card", image: "exampleImage3")
    ]
    
    let beadImages = ["bead1", "bead2", "bead3", "bead4", "bead5"] // Update this array to include only existing images
    
    var body: some View {
        GeometryReader { geometry in
            let centerX = geometry.size.width / 1.3
            let centerY = geometry.size.height / 1.7
            let arcRadius = geometry.size.width / 1.2
            VStack {
                HeaderViewTasbih()                
                // Carousel cards
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 12) {
                        ForEach(cards) { card in
                            CardView(card: card)
                        }
                    }
                    .padding()
                }
                
                ZStack {
                    Path { path in
                        path.addArc(center: CGPoint(x: centerX, y: centerY),
                                    radius: arcRadius,
                                    startAngle: .degrees(180),
                                    endAngle: .degrees(270),
                                    clockwise: false)
                        
                        path.addArc(center: CGPoint(x: centerX, y: centerY),
                                    radius: arcRadius,
                                    startAngle: .degrees(270),
                                    endAngle: .degrees(360),
                                    clockwise: false)
                    }
                    .stroke(Color.black, lineWidth: 2)
                    
                    ForEach(beads.indices, id: \.self) { index in
                        Image(beads[index].image)
                            .resizable()
                            .frame(width: beadRadius * 2, height: beadRadius * 2)
                            .position(beads[index].position)
                            .onTapGesture {
                                moveBead(at: index)
                            }
                    }
                }
                .onAppear {
                    self.initializeBeads(centerX: centerX, centerY: centerY, arcRadius: arcRadius)
                }
                .frame(width: geometry.size.width, height: 100)
                .padding(.bottom,50)
                
                Spacer()
                
                // Bottom bar for selecting beads
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<beadImages.count, id: \.self) { index in
                            Image(beadImages[index])
                                .resizable()
                                .frame(width: beadRadius * 2, height: beadRadius * 2)
                                .padding()
                                .background(selectedBeadIndex == index ? Color.gray.opacity(0.1) : Color.clear)
                                .cornerRadius(beadRadius)
                                .onTapGesture {
                                    self.selectedBeadIndex = index
                                    if let selectedIndex = selectedBeadIndex {
                                        beads = beads.map { Bead(angle: $0.angle, position: $0.position, image: beadImages[selectedIndex]) }
                                    }
                                }
                        }
                    }
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color(hex: "#E3FFF8"), Color(hex: "#B6F3BA")]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .padding(.bottom,12)
                }
                
            }
        }
    }
    
    private func initializeBeads(centerX: CGFloat, centerY: CGFloat, arcRadius: CGFloat) {
        var initialBeads: [Bead] = []
        
        // Calculate angle step based on screen size
        let screenWidth = UIScreen.main.bounds.width
        let angleStep = screenWidth > 393 ? 96.0 / Double(leftBeadsCount + rightBeadsCount + 3) : 103.0 / Double(leftBeadsCount + rightBeadsCount + 3)
        
        for i in 0..<leftBeadsCount {
            let angle = 195.0 + Double(i) * angleStep
            let x = centerX + arcRadius * CGFloat(cos(angle * .pi / 180))
            let y = centerY + arcRadius * CGFloat(sin(angle * .pi / 180))
            initialBeads.append(Bead(angle: angle, position: CGPoint(x: x, y: y), image: beadImages.first ?? "bead1"))
        }
        
        for i in 0..<rightBeadsCount {
            let angle = 265.0 + Double(i) * angleStep
            let x = centerX + arcRadius * CGFloat(cos(angle * .pi / 180))
            let y = centerY + arcRadius * CGFloat(sin(angle * .pi / 180))
            initialBeads.append(Bead(angle: angle, position: CGPoint(x: x, y: y), image: beadImages.first ?? "bead1"))
        }
        
        beads = initialBeads
    }
    
    private func moveBead(at index: Int) {
        let bead = beads[index]
        let centerX = UIScreen.main.bounds.width / 1.2
        let centerY = UIScreen.main.bounds.height / 1.5
        let arcRadius = circleRadius
        
        // Use the initialized angle directly for positioning
        let x = centerX + arcRadius * CGFloat(cos(bead.angle * .pi / 180))
        let y = centerY + arcRadius * CGFloat(sin(bead.angle * .pi / 180))
        let newPosition = CGPoint(x: x, y: y)
        
        withAnimation(.easeInOut(duration: 0.3)) {
            beads[index] = Bead(angle: bead.angle, position: newPosition, image: bead.image)
        }
    }
}
struct CardView: View {
    let card: Card

    var body: some View {
        VStack {
            Image(card.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250 ,height: 60)
            Text(card.title)
                .font(.title2)
                .bold()
            Text(card.subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(24)
        .shadow(radius: 2)
    }
}

struct HeaderViewTasbih: View {
    var body: some View {
        HStack() {
            Spacer()
            Text("Tasbih")
                .font(.headline)
                .bold()
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "ellipsis")
                .font(.headline)
                .foregroundColor(.black)
     
        }
        
        .padding(.horizontal, 24)
        .padding(.bottom,12)
        .background(Color.white)
        .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 2)
    }
}

struct TasbihView_Previews: PreviewProvider {
    static var previews: some View {
        TasbihView()
    }
}
