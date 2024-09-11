
import SwiftUI

struct AllahNamesView: View {
    let names = Array(repeating: "AR-RAHMAAN", count: 5)
    let meaning = "The Most Or Entirely Merciful"
    
    var body: some View {
        NavigationView {
            VStack {
                // Header with title
                VStack {
                    HeaderViewAllahNames()
                    Image("AllahNames")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 230)
                        .clipped()
                        
                }
                .padding()
                
                // List of names
                List(names, id: \.self) { name in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(name)
                                .font(.title2)
                                .fontWeight(.bold)
                            Text(meaning)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Image("AllahNamesLogo") // Placeholder for Arabic script icon
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    }
                    .padding(.vertical)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct HeaderViewAllahNames: View {
    var body: some View {
        HStack() {
            Spacer()
            Text("Allah Names")
                .font(.headline)
                .bold()
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "ellipsis")
                .font(.headline)
                .foregroundColor(.black)
     
        }
        .padding(.top, 50)
        .padding(.leading)
        .background(Color.white)
    }
}

struct AllahNamesView_Previews: PreviewProvider {
    static var previews: some View {
        AllahNamesView()
    }
}

