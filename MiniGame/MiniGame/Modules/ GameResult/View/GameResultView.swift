import UIKit

protocol IGameResultView: UIView {
    var pressedMainMenuButton: (() -> Void)? { get set }
    func setTextLabels(userCount: String, computerCount: String, win: String)
}

final class GameResultView: UIView {
    private let titleLabel = MainLabel()
    private let userCountLabel = MainLabel()
    private let computerCountLabel = MainLabel()
    private let winLabel = MainLabel()
    private let mainMenuButton = MainButton()
    private var constraint = [NSLayoutConstraint]()
    
    var pressedMainMenuButton: (() -> Void)?
    
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
    func setTextLabels(userCount: String, computerCount: String, win: String) {
        self.userCountLabel.text = userCount
        self.computerCountLabel.text = computerCount
        self.winLabel.text = win
    }
}

private extension GameResultView {
    func customizeView() {
        self.backgroundColor = .white
        self.addSubviews()
        self.customizeLabels()
        self.customizeButton()
        self.configureLayout()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.configureLayout),
                                               name: UIDevice.orientationDidChangeNotification,
                                               object: nil)
    }
    
    func addSubviews() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.userCountLabel)
        self.addSubview(self.computerCountLabel)
        self.addSubview(self.winLabel)
        self.addSubview(self.mainMenuButton)
    }
    
    func customizeLabels() {
        self.titleLabel.text = "Scores:"
    }
      
    func customizeButton() {
        self.mainMenuButton.setTitle("Main menu", for: .normal)
        self.mainMenuButton.addTarget(self, action: #selector(self.pressedButton), for: .touchUpInside)
    }
    
    @objc func pressedButton() {
        self.pressedMainMenuButton?()
    }
    
    func setConstraints() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.userCountLabel.translatesAutoresizingMaskIntoConstraints = false
        self.computerCountLabel.translatesAutoresizingMaskIntoConstraints = false
        self.winLabel.translatesAutoresizingMaskIntoConstraints = false
        self.mainMenuButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.deactivate(self.constraint)
        self.constraint = [
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: CommonConstraints.top * UIScreen.main.bounds.height),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CommonConstraints.left),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -CommonConstraints.left),
            
            self.userCountLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -CommonConstraints.maginSmall * UIScreen.main.bounds.height),
            self.userCountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CommonConstraints.left),
            self.userCountLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -CommonConstraints.left),
            
            self.computerCountLabel.topAnchor.constraint(equalTo: self.centerYAnchor, constant: CommonConstraints.maginSmall * UIScreen.main.bounds.height),
            self.computerCountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CommonConstraints.left),
            self.computerCountLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -CommonConstraints.left),
            
            self.winLabel.bottomAnchor.constraint(equalTo: self.mainMenuButton.topAnchor, constant: -CommonConstraints.magin * UIScreen.main.bounds.height),
            self.winLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CommonConstraints.left),
            self.winLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -CommonConstraints.left),
            
            self.mainMenuButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -CommonConstraints.bottom * UIScreen.main.bounds.height),
            self.mainMenuButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CommonConstraints.left),
            self.mainMenuButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -CommonConstraints.left),
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

