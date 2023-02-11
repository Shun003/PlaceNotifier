import UIKit

final class PlaceNotifierListViewController: UIViewController {
    private lazy var placeNotifierListView = PlaceNotifierListView()
    
    private var presenter: PlaceNotifierListPresenterInput!
    func inject(presenter: PlaceNotifierListPresenterInput) {
        self.presenter = presenter
    }
    
    override func loadView() {
        self.view = placeNotifierListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        presenter.viewDidLoad()
    }
    
    private func setup() {
        // Navigation
        navigationItem.title = "PlaceNotifier"
        navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.setToolbarHidden(false, animated: false)
        toolbarItems = [
            UIBarButtonItem(customView: placeNotifierListView.addNewPlaceNotifierButton),
            UIBarButtonItem(systemItem: .flexibleSpace)
        ]
        
        
        // addNewPlaceNotifierButton
        placeNotifierListView.addNewPlaceNotifierButton.addAction(
            UIAction { _ in self.presenter?.didTappedCreateNewPlaseNotifierButton() },
            for: .touchUpInside
        )
        
        // TableView
        placeNotifierListView.tableView.register(
            PlaceNotifierCell.self,
            forCellReuseIdentifier: "PlaceNotifierCell"
        )
        placeNotifierListView.tableView.dataSource = self
        placeNotifierListView.tableView.delegate = self
    }
}

// MARK: - PlaceNotifierListPresenter
extension PlaceNotifierListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfPlaceNotifiers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceNotifierCell") as! PlaceNotifierCell
        if let placeNotifier = presenter.placeNotifier(forRow: indexPath.row) {
            cell.configure(placeNotifier: placeNotifier)
        }
        return cell
    }
}

// MARK: - Placenotifier
extension PlaceNotifierListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


// MARK: - PlaceNotifierListPresenterOutput
extension PlaceNotifierListViewController: PlaceNotifierListPresenterOutput {
    // アラートを表示する
    func showingAlert(title: String) {
        let alertController = UIAlertController(
            title: title,
            message: nil,
            preferredStyle: .alert
        )
        let dismissAction = UIAlertAction(title: "閉じる", style: .default)
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true)
    }
    
    /// 新規PlaceNotifier作成画面を表示
    func showingCreateNewPalceNotifierView() {
        let createNewPlaceNotifierViewController: CreateNewPlaceNotifierViewController = {
            let view = CreateNewPlaceNotifierViewController()
            let model = CreateNewPlaceNotifierModel()
            let presenter = CreateNewPlaceNotifierPresenter(view: view, model: model)
            view.inject(presenter: presenter)
            return view
        }()
        
        present(UINavigationController(rootViewController: createNewPlaceNotifierViewController), animated: true)
    }
}