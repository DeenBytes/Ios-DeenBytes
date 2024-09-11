import SwiftUI

struct DuaChapterView: View {
    var body: some View {
        VStack {
            // Header
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
            
            // Image with overlay
            ZStack(alignment: .top) {
                Image("duaview")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipShape(CurvedShape())
                    .clipped()
                    .overlay(
                        VStack {
                            Spacer()
                            VStack {
                                Text("Hisnul Muslim")
                                    .font(.headline)
                                
                                Text("(Fortress of the Muslim)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding(.bottom, 20)
                        }
                    )
             
            }
            
            // List covering 20% of the image
            VStack(alignment: .center) {
          
                List {
                    Section(header: Text("Morning & Evening")) {
                        ForEach(0..<7) { index in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("When waking up")
                                        .font(.body)
                                }
                                Spacer()
                                Button(action: {
                                    // Handle bookmark action
                                }) {
                                    Image(systemName: "bookmark")
                                        .foregroundColor(.yellow)
                                }
                            }
                            .padding(.vertical, 10)
                            .cornerRadius(24)
                        }
                    }
                    
                }
                
            }
            .cornerRadius(24)
            .edgesIgnoringSafeArea(.all)
     
        }
    }
}

struct DuaChapterView_Previews: PreviewProvider {
    static var previews: some View {
        DuaChapterView()
    }
}

