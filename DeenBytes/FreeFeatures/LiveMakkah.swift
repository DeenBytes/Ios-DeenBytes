
import SwiftUI
import WebKit

struct LiveMakkahView: View {
    let youtubeURL = "https://www.youtube.com/watch?v=qttADqSTFcc" // Use embed URL for direct video playback
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HeaderViewMakkah()
            
            // WebView for YouTube video
            WebView(urlString: youtubeURL)
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color.black)
      
    }
}

// Custom WebView component using WKWebView
struct WebView: UIViewRepresentable {
    let urlString: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // Update the view
    }
}

struct HeaderViewMakkah: View {
    var body: some View {
        HStack() {
            Spacer()
            Text("Live Makkah")
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

struct LiveMakkahView_Previews: PreviewProvider {
    static var previews: some View {
        LiveMakkahView()
    }
}
