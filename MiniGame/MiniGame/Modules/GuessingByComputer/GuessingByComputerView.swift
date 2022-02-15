import UIKit

protocol IGuessingByComputerView: UIView {
}

final class GuessingByComputerView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customizeView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.customizeView()
    }
}

extension GuessingByComputerView: IGuessingByComputerView {
}

private extension GuessingByComputerView {
    func customizeView() {
        self.backgroundColor = .white
        self.addSubviews()
        self.customizeLabels()
        self.customizeButtons()
        self.setConstraints()
    }
    
    func addSubviews() {
    }
    
    func customizeLabels() {
    }
      
    func customizeButtons() {
    }
    
    func setConstraints() {
    }
}

