import SwiftUI

struct DuasView: View {
    var body: some View {
        VStack {
            // Navigation bar
            HStack {
                Button(action: {
                    // Action for back button
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                }
                Spacer()
                Text("Dua")
                    .font(.title2)
                    .foregroundColor(.black)
                Spacer()
                Button(action: {
                    // Action for bell button
                }) {
                    Image(systemName: "bell.fill")
                        .foregroundColor(.black)
                }
            }
            .padding()
            
            // Header with image
            Image("duaview")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
                .clipShape(CurvedShape())
                .overlay(
                    VStack {
                        Spacer()
                        HStack(spacing: 0) {
                            Button(action: {
                                // Action for Categories
                            }) {
                                Text("Categories")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color(hex: "#FFD700"))
                                    .cornerRadius(24)
                            }
                            Spacer()
                            Button(action: {
                                // Action for My Duas
                            }) {
                                Text("My Duas")
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(24)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, -20)
                    }
                        .padding(.bottom,12)
                )
            
            // Search bar
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search", text: .constant(""))
                    .padding()
            }
            .padding(.horizontal)
            .background(Color.white)
            .cornerRadius(24)
            .padding()
            
            // Grid of Duas categories
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    DuaCategoryView(imageName: "allduaicon", title: "All Duas", chapters: "132 Chapters")
                    DuaCategoryView(imageName: "morningicon", title: "Morning & Evening", chapters: "6 Chapters")
                    DuaCategoryView(imageName: "prayericon", title: "Prayer", chapters: "28 Chapters")
                    DuaCategoryView(imageName: "hajjicon", title: "Hajj & Umrah", chapters: "8 Chapters")
                    DuaCategoryView(imageName: "travelicon", title: "Travel", chapters: "11 Chapters")
                    DuaCategoryView(imageName: "joyicon", title: "Joy & Distress", chapters: "11 Chapters")
                    DuaCategoryView(imageName: "natureicon", title: "Nature", chapters: "11 Chapters")
                    DuaCategoryView(imageName: "goodetiquetteicon", title: "Good Etiquette", chapters: "11 Chapters")
                    DuaCategoryView(imageName: "homeicon", title: "Home & Family", chapters: "11 Chapters")
                    DuaCategoryView(imageName: "foodicon", title: "Food & Drink", chapters: "11 Chapters")
                    DuaCategoryView(imageName: "sicknessicon", title: "Sickness & Death", chapters: "11 Chapters")
                    // Add more categories as needed
                }
                .padding()
            }
        }
        .background(Color(.systemGray6))
    }
}

struct DuaCategoryView: View {
    let imageName: String
    let title: String
    let chapters: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 60)
            Text(title)
                .font(.headline)
            Text(chapters)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(width: 140,height: 100)
        .padding()
        .background(Color.white)
        .cornerRadius(24)
        .shadow(radius: 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DuasView()
    }
}
