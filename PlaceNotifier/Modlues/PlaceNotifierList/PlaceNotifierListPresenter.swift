import Foundation

protocol PlaceNotifierListPresenterInput {
    /// Viewの読み込み完了時に呼ばれる
    func viewDidLoad()
    
    /// 新規PlaceNotifier作成ボタンが押された
    func didTappedCreateNewPlaseNotifierButton()
    
    /// PlaceNotifiersの情報が更新された
    func didUpdatedPlaceNotifierList()
    
    /// PlaceNotifierの数
    var numberOfPlaceNotifiers: Int { get }
    /// 指定行のPlaceNotifierを取得
    func placeNotifier(forRow row: Int) -> PlaceNotifier?
}

protocol PlaceNotifierListPresenterOutput: AnyObject {
    /// アラートダイアログを表示
    func showingAlert(title: String)
    /// 新規PlaceNotifier作成画面を表示
    func showingCreateNewPalceNotifierView()
    
    /// TableViewの表示を更新
    func reloadTableViewData()
}

final class PlaceNotifierPresenter: PlaceNotifierListPresenterInput {
    private var model: PlaceNotifierListModelInput
    private weak var view: PlaceNotifierListPresenterOutput!
    
    private var placeNotifiers: [PlaceNotifier] = []
    
    /// PlaceNotifierの数
    var numberOfPlaceNotifiers: Int {
        placeNotifiers.count
    }
    
    init(view: PlaceNotifierListPresenterOutput, model: PlaceNotifierListModelInput) {
        self.model = model
        self.view = view
    }
    
    /// Viewの読み込み完了時に呼ばれる
    func viewDidLoad() {
        updatePlaceNotifiers()
    }
    
    /// PlaceNotifiersの情報が更新された
    func didUpdatedPlaceNotifierList() {
        updatePlaceNotifiers()
    }
    
    /// 新規PlaceNotifier作成ボタンが押された
    func didTappedCreateNewPlaseNotifierButton() {
        view.showingCreateNewPalceNotifierView()
    }
    
    /// 指定行のPlaceNotifierを取得
    func placeNotifier(forRow row: Int) -> PlaceNotifier? {
        guard placeNotifiers.count > row else { return nil }
        return placeNotifiers[row]
    }
}

// MARK: - Private Functions
extension PlaceNotifierPresenter {
    /// PlaceNotifiersを更新する
    private func updatePlaceNotifiers() {
        do {
            placeNotifiers = try model.fetchPlaceNotifirs()
            view?.reloadTableViewData()
        } catch {
            view.showingAlert(title: "テスト")
        }
    }
}
