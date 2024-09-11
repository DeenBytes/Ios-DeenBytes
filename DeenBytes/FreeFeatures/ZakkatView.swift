import SwiftUI

struct ZakkatView: View {
    var body: some View {
        VStack(spacing: 0) {
            HeaderView()
            
            ScrollView() {
                VStack(spacing: 0) {
                    AssetRow(iconName: "money", title: "Money")
                    AssetRow(iconName: "gold", title: "Gold", backgroundColor: .yellow)
                    AssetRow(iconName: "silver", title: "Silver")
                    AssetRow(iconName: "investments", title: "Investments", backgroundColor: .yellow)
                    AssetRow(iconName: "properties", title: "Properties")
                    AssetRow(iconName: "business", title: "Business", backgroundColor: .yellow)
                    AssetRow(iconName: "agriculture", title: "Agriculture")
                    AssetRow(iconName: "cattle", title: "Cattle", backgroundColor: .yellow)
                    AssetRow(iconName: "payables", title: "Payables")
                    AssetRow(iconName: "others", title: "Others", backgroundColor: .yellow)
                }
            }
            
        
            
            VStack(spacing: 0) {
                TotalAssetsView()
                ZakatDueView()
                NisabView()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            Spacer()
            Text("Zakat")
                .font(.headline)
            Spacer()
            Text("INR")
                .foregroundColor(.black)
        }
        .padding(.top, 60)
        .padding(.bottom, 24)
        .padding(.horizontal, 24)
        .background(Color.white)
        .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 2)
    }
}

struct AssetRow: View {
    var iconName: String
    var title: String
    var backgroundColor: Color = Color.white
    
    var body: some View {
        HStack {
            Image(iconName)
                .foregroundColor(.black)
            Text(title)
                .foregroundColor(.black)
            Spacer()
            Text("0.00 INR")
                .foregroundColor(.black)
        }
        .padding()
        .background(backgroundColor)
        .border(Color.gray.opacity(0.2), width: 0.5)
    }
}

struct TotalAssetsView: View {
    var body: some View {
        HStack {
            Text("Total Assets")
                .foregroundColor(.white)
            Spacer()
            Text("0.00 INR")
                .foregroundColor(.white)
        }
        .padding()
        .background(Color.green)
        .font(.title2)
    }
}

struct ZakatDueView: View {
    var body: some View {
        HStack {
            Text("Zakat Due")
                .foregroundColor(.white)
            Spacer()
            Text("0.00 INR")
                .foregroundColor(.white)
        }
        .padding()
        .background(Color.orange)
        .font(.title2)
    }
}

struct NisabView: View {
    var body: some View {
        HStack {
            Text("Nisab")
                .foregroundColor(.black)
            Spacer()
            Text("0.00 INR")
                .foregroundColor(.black)
        }
        .padding()
        .background(Color.yellow)
        .font(.title2)
    }
}

struct ZakkatView_Previews: PreviewProvider {
    static var previews: some View {
        ZakkatView()
    }
}
