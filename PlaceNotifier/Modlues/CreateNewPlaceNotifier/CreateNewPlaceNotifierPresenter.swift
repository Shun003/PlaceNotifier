import Foundation

protocol CreateNewPlaceNotifierPresenterInput {
    /// 作成ボタンが押された
    func didTappedCreateButton(titleText: String)
    /// キャンセルボタンが押された
    func didTappedCancelButton()
}

protocol CreateNewPlaceNotifierPresenterOutput: AnyObject {
    /// 自信を閉じる
    func dismiss()
}

final class CreateNewPlaceNotifierPresenter: CreateNewPlaceNotifierPresenterInput {
    private weak var view: CreateNewPlaceNotifierPresenterOutput?
    private var model: CreateNewPlaceNotifierModelInput
    
    private let updatePlaceNotifiersHandler: ()->()
    
    init(
        view: CreateNewPlaceNotifierPresenterOutput,
        model: CreateNewPlaceNotifierModelInput,
        updatePlaceNotifiersHandler: @escaping ()->()
    ) {
        self.view = view
        self.model = model
        self.updatePlaceNotifiersHandler = updatePlaceNotifiersHandler
    }
    
    /// 作成ボタンが押された
    func didTappedCreateButton(titleText: String) {
        let newPlaceNotifier = PlaceNotifier(title: titleText)
        do {
            try model.createNewPlaceNotifier(newPlaceNotifier)
            updatePlaceNotifiersHandler()
            view?.dismiss()
        } catch {
            // TODO: Error Handling
        }
    }
    
    /// キャンセルボタンが押された
    func didTappedCancelButton() {
        view?.dismiss()
    }
}
