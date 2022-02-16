import UIKit

final class UserButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.tintColor = .black
        self.backgroundColor = .white
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = ButtonConstraint.radius
        self.layer.masksToBounds = true
    }
}
