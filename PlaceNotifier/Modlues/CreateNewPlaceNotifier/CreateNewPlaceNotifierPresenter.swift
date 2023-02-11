import Foundation

protocol CreateNewPlaceNotifierPresenterInput {
    
}

protocol CreateNewPlaceNotifierPresenterOutput: AnyObject {
    
}

final class CreateNewPlaceNotifierPresenter: CreateNewPlaceNotifierPresenterInput {
    private weak var view: CreateNewPlaceNotifierPresenterOutput?
    private var model: CreateNewPlaceNotifierModelInput
    
    init(view: CreateNewPlaceNotifierPresenterOutput, model: CreateNewPlaceNotifierModelInput) {
        self.view = view
        self.model = model
    }
}
