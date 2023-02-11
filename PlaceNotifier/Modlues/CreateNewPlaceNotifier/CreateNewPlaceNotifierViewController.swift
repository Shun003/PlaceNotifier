import UIKit

final class CreateNewPlaceNotifierViewController: UIViewController {
    let createNewPlaceNotifierView = CreateNewPlaceNotifierView()
    
    private var presenter: CreateNewPlaceNotifierPresenterInput?
    func inject(presenter: CreateNewPlaceNotifierPresenterInput) {
        self.presenter = presenter
    }
    
    override func loadView() {
        self.view = createNewPlaceNotifierView
    }
}

// MARK: - CreateNewPlaceNotifierPresenterOutput
extension CreateNewPlaceNotifierViewController: CreateNewPlaceNotifierPresenterOutput {
    
}
