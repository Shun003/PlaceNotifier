import UIKit

final class CreateNewPlaceNotifierViewController: UIViewController {
    let createNewPlaceNotifierView = CreateNewPlaceNotifierView()
    
    private var presenter: CreateNewPlaceNotifierPresenterInput?
    func inject(presenter: CreateNewPlaceNotifierPresenterInput) {
        self.presenter = presenter
    }
    
    override func loadView() {
        self.view = createNewPlaceNotifierView
        setup()
    }
    
    private func setup() {
        navigationItem.title = "新規Notifer"
        navigationController?.setToolbarHidden(false, animated: false)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: createNewPlaceNotifierView.createButton)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: createNewPlaceNotifierView.cancelButton)
        
        createNewPlaceNotifierView.createButton.addAction(
            UIAction { [weak self] _ in
                guard  let self, let titleText = self.createNewPlaceNotifierView.titleTextField.text else { return }
                self.presenter?.didTappedCreateButton(titleText: titleText)
            },
            for: .touchUpInside
        )
        
        createNewPlaceNotifierView.cancelButton.addAction(
            UIAction { [weak self] _ in
                self?.presenter?.didTappedCancelButton()
            },
            for: .touchUpInside
        )
    }
}

// MARK: - CreateNewPlaceNotifierPresenterOutput
extension CreateNewPlaceNotifierViewController: CreateNewPlaceNotifierPresenterOutput {
    func dismiss() {
        dismiss(animated: true)
    }
}
