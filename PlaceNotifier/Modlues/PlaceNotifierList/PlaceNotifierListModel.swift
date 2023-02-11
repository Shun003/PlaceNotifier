import Foundation

protocol PlaceNotifierListModelInput {
    /// PlaceNotifierを取得
    func fetchPlaceNotifirs() throws -> [PlaceNotifier]
}

final class PlaceNotifierListModel: PlaceNotifierListModelInput {
    func fetchPlaceNotifirs() throws -> [PlaceNotifier] {
        try CoreDataRepository.fetchPlaceNotifiers()
    }
}

final class PlaceNotifierListDummyModel: PlaceNotifierListModelInput {
    func fetchPlaceNotifirs() throws -> [PlaceNotifier] {
        [
            PlaceNotifier(title: "テスト１"),
            PlaceNotifier(title: "テスト２"),
            PlaceNotifier(title: "テスト３"),
            PlaceNotifier(title: "テスト４"),
            PlaceNotifier(title: "テスト５"),
            PlaceNotifier(title: "テスト５"),
            PlaceNotifier(title: "テスト５"),
            PlaceNotifier(title: "テスト５"),
            PlaceNotifier(title: "テスト５"),
            PlaceNotifier(title: "テスト５"),
            PlaceNotifier(title: "テスト５"),
            PlaceNotifier(title: "テスト５"),
            PlaceNotifier(title: "テスト５"),
            PlaceNotifier(title: "テスト５"),
        ]
    }
}
