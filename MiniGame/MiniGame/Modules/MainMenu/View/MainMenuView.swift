import UIKit

protocol IMainMenuView: UIView {
    var pressedStartGameButton: (() -> Void)? { get set }
}

final class MainMenuView: UIView, IMainMenuView {
    private let titleLabel = MainLabel()
    private let startGameButton = MainButton()
    
    var pressedStartGameButton: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customizeView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.customizeView()
    }
}

private extension MainMenuView {
    func customizeView() {
        self.backgroundColor = .white
        self.addSubviews()
        self.customizeLabel()
        self.customizeButton()
        self.setConstraints()
    }
    
    func addSubviews() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.startGameButton)
    }
    
    func customizeLabel() {
        self.titleLabel.text = DefaultText.titleMainMenu
    }
      
    func customizeButton() {
        self.startGameButton.setTitle(DefaultText.startNewGame, for: .normal)
        self.startGameButton.addTarget(self, action: #selector(self.pressedButton), for: .touchUpInside)
    }
    
    @objc func pressedButton() {
        self.pressedStartGameButton?()
    }
    
    func setConstraints() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.startGameButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: CommonConstraints.top),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CommonConstraints.left),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -CommonConstraints.left),
            
            self.startGameButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CommonConstraints.left),
            self.startGameButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -CommonConstraints.left),
            self.startGameButton.heightAnchor.constraint(equalToConstant: ButtonConstraint.mainHeight),
            self.startGameButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -CommonConstraints.bottom)
        ])
    }
}

