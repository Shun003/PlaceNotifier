import Foundation

protocol CreateNewPlaceNotifierModelInput {
    func createNewPlaceNotifier(_ placeNotifier: PlaceNotifier) throws
}

final class CreateNewPlaceNotifierModel: CreateNewPlaceNotifierModelInput {
    func createNewPlaceNotifier(_ placeNotifier: PlaceNotifier) throws {
        try CoreDataRepository.createCDPlaceNotifier(by: placeNotifier)
    }
}
