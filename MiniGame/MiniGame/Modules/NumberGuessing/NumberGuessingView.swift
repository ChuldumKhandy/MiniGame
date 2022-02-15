import UIKit

protocol INumberGuessingView: UIView {
}

final class NumberGuessingView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customizeView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.customizeView()
    }
}

extension NumberGuessingView: INumberGuessingView {
}

private extension NumberGuessingView {
    func customizeView() {
        self.backgroundColor = .white
        self.addSubviews()
        self.customizeButton()
        self.setConstraints()
    }
    
    func addSubviews() {
    }
    
    func customizeTextField() {
    }
      
    func customizeButton() {
    }
    
    func setConstraints() {
    }
}

