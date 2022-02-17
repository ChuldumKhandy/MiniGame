import UIKit

final class MainTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.borderStyle = .roundedRect
        self.textAlignment = .center
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemGray4.cgColor
        self.layer.cornerRadius = TextFieldConstraint.radius
        self.layer.masksToBounds = true
    }
}
