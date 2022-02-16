import UIKit

protocol IGameResultView: UIView {
}

final class GameResultView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customizeView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.customizeView()
    }
}

extension GameResultView: IGameResultView {
}

private extension GameResultView {
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

