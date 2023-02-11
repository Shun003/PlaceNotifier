import UIKit

final class PlaceNotifierCell: UITableViewCell {
    private lazy var titleLabel = createTitleLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        [titleLabel]
            .forEach(addSubview)
        
        layoutUIParts()
    }
    
    func configure(placeNotifier: PlaceNotifier) {
        titleLabel.text = placeNotifier.title
    }
}

// MARK: - Create UIParts
extension PlaceNotifierCell {
    private func createTitleLabel() -> UILabel {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }
}

// MARK: - Layout UIParts
extension PlaceNotifierCell {
    private func layoutUIParts() {
        let layoutGuide = UILayoutGuide()
        addLayoutGuide(layoutGuide)
        
        NSLayoutConstraint.activate([
            layoutGuide.centerXAnchor.constraint(equalTo: centerXAnchor),
            layoutGuide.centerYAnchor.constraint(equalTo: centerYAnchor),
            layoutGuide.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            layoutGuide.heightAnchor.constraint(equalTo: heightAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: layoutGuide.centerYAnchor),
            titleLabel.widthAnchor.constraint(equalTo: layoutGuide.widthAnchor),
            titleLabel.heightAnchor.constraint(equalTo: layoutGuide.heightAnchor)
        ])
    }
}
