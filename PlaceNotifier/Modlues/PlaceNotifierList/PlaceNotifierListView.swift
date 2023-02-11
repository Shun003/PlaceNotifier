import UIKit

final class PlaceNotifierListView: UIView {
    private(set) lazy var tableView = createTableView()
    private(set) lazy var createNewPlaceNotifierButton = createCreateNewPlaceNotifierButton()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = .systemBackground
        
        [tableView]
            .forEach(addSubview)
        
        layoutUIParts()
    }
}

// MARK: - Create UIParts
extension PlaceNotifierListView {
    private func createTableView() -> UITableView {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }
    
    private func createCreateNewPlaceNotifierButton() -> UIButton {
        var configration = UIButton.Configuration.plain()
        configration.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 18, weight: .bold)
        configration.image =  UIImage(systemName: "plus.circle.fill", withConfiguration: imageConfig)
        configration.imagePadding = 10.0
        
        let titleAttributees = AttributeContainer([
            .font: UIFont.systemFont(ofSize: 17, weight: .bold)
        ])
        configration.attributedTitle = AttributedString("新規", attributes: titleAttributees)
        
        let button = UIButton(configuration: configration)
        return button
    }
}

// MARK: - Layout UIParts
extension PlaceNotifierListView {
    private func layoutUIParts() {
        NSLayoutConstraint.activate([
            tableView.centerXAnchor.constraint(equalTo: centerXAnchor),
            tableView.centerYAnchor.constraint(equalTo: centerYAnchor),
            tableView.widthAnchor.constraint(equalTo: widthAnchor),
            tableView.heightAnchor.constraint(equalTo: heightAnchor),
        ])
    }
}
