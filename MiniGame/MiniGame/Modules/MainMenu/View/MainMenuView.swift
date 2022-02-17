import UIKit

protocol IMainMenuView: UIView {
    var pressedStartGameButton: (() -> Void)? { get set }
}

final class MainMenuView: UIView, IMainMenuView {
    private let titleLabel = MainLabel()
    private let startGameButton = MainButton()
    private var constraint = [NSLayoutConstraint]()
    
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
        self.configureLayout()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.configureLayout),
                                               name: UIDevice.orientationDidChangeNotification,
                                               object: nil)
    }
    
    func addSubviews() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.startGameButton)
    }
    
    func customizeLabel() {
        self.titleLabel.text = "My Awesome Game"
    }
      
    func customizeButton() {
        self.startGameButton.setTitle("Start New Game", for: .normal)
        self.startGameButton.addTarget(self, action: #selector(self.pressedButton), for: .touchUpInside)
    }
    
    @objc func pressedButton() {
        self.pressedStartGameButton?()
    }
    
    func setConstraints() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.startGameButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.deactivate(self.constraint)
        self.constraint = [
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: CommonConstraints.top * UIScreen.main.bounds.height),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CommonConstraints.left),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -CommonConstraints.left),
            
            self.startGameButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CommonConstraints.left),
            self.startGameButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -CommonConstraints.left),
            self.startGameButton.heightAnchor.constraint(equalToConstant: ButtonConstraint.mainHeight),
            self.startGameButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -CommonConstraints.bottom * UIScreen.main.bounds.height)
        ]
        NSLayoutConstraint.activate(self.constraint)
    }
    
    @objc func configureLayout() {
        if UIDevice.current.orientation.isLandscape {
            self.setConstraints()
        } else {
            self.setConstraints()
        }
    }
}

