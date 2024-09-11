import SwiftUI

class HomepageViewModel: ObservableObject {
    @Published var selectedView: String? = nil

    func navigateTo(_ view: String) {
        selectedView = view
    }
}
