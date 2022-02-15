import UIKit

final class MainButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = .blue
        self.layer.cornerRadius = ButtonConstraint.radius
        self.layer.masksToBounds = true
    }
}
