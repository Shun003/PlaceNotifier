import SwiftUI

struct PlaceNotifierCell: View {
    let placeNotifier: PlaceNotifier
    
    init(_ placeNotifier: PlaceNotifier) {
        self.placeNotifier = placeNotifier
    }
    
    var body: some View {
        Text(placeNotifier.title)
    }
}
