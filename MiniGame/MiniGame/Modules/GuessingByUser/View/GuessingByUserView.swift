import UIKit

protocol IGuessingByUserView: UIView {
}

final class GuessingByUserView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customizeView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.customizeView()
    }
}

extension GuessingByUserView: IGuessingByUserView {
}

private extension GuessingByUserView {
    func customizeView() {
        self.backgroundColor = .white
        self.addSubviews()
        self.customizeButton()
        self.setConstraints()
    }
    
    func addSubviews() {
    }
    
    func customizeLabels() {
    }
      
    func customizeButton() {
    }
    
    func setConstraints() {

    }
}

