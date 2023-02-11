import UIKit

final class CreateNewPlaceNotifierView: UIView {
    private(set) lazy var titleTextField = createTitleTextField()
    private(set) lazy var createButton = createCreateButton()
    private(set) lazy var cancelButton = createCancelButton()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = .systemBackground
        
        [titleTextField]
            .forEach(addSubview)
        
        layoutUIParts()
    }
}

// MARK: - Create UIParts
extension CreateNewPlaceNotifierView {
    /// タイトル入力用テキストフィールド
    private func createTitleTextField() -> UITextField {
        let titleTextField = UITextField()
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.borderStyle = .roundedRect
        return titleTextField
    }
    
    /// 作成ボタン
    private func createCreateButton() -> UIButton {
        var configration = UIButton.Configuration.plain()
        var titleAttributes = AttributeContainer()
        titleAttributes.font = .systemFont(ofSize: 18, weight: .bold)
        configration.attributedTitle = AttributedString("作成", attributes: titleAttributes)
        
        let createButton = UIButton(configuration: configration)
        return createButton
    }
    
    /// キャンセルボタン
    private func createCancelButton() -> UIButton {
        let cancelButton = UIButton(type: .system)
        cancelButton.setTitle("キャンセル", for: .normal)
        return cancelButton
    }
}

// MARK: - Layout UIParts
extension CreateNewPlaceNotifierView {
    private func layoutUIParts() {
        NSLayoutConstraint.activate([
            titleTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9)
        ])
    }
}
