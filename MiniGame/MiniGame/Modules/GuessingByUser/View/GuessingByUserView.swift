import UIKit

protocol IGuessingByUserView: UIView {
    var pressedGuessButton: ((String?) -> Void)? { get set }
    
    func setTextLabels(tryCounter: String, computerNumber: String)
}

final class GuessingByUserView: UIView {
    private let tryLabel = MainLabel()
    private let titleLabel = MainLabel()
    private let answerTextField = MainTextField()
    private let computerNumberLabel = MainLabel()
    private let guessButton = MainButton()
    
    var pressedGuessButton: ((String?) -> Void)?
    
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
    func setTextLabels(tryCounter: String, computerNumber: String) {
        self.tryLabel.text = DefaultText.numberTry + tryCounter
        self.computerNumberLabel.text = computerNumber
    }
}

private extension GuessingByUserView {
    func customizeView() {
        self.backgroundColor = .white
        self.addSubviews()
        self.customizeLabels()
        self.customizeButton()
        self.setConstraints()
    }
    
    func addSubviews() {
        self.addSubview(self.tryLabel)
        self.addSubview(self.titleLabel)
        self.addSubview(self.answerTextField)
        self.addSubview(self.guessButton)
        self.addSubview(self.computerNumberLabel)
    }
    
    func customizeLabels() {
        self.titleLabel.text = DefaultText.yourAreGuessing
    }
      
    func customizeButton() {
        self.guessButton.setTitle(DefaultText.guess, for: .normal)
        self.guessButton.addTarget(self, action: #selector(self.pressedButton), for: .touchUpInside)
    }
    
    @objc func pressedButton() {
        self.pressedGuessButton?(self.answerTextField.text)
    }
    
    func setConstraints() {
        self.tryLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.answerTextField.translatesAutoresizingMaskIntoConstraints = false
        self.guessButton.translatesAutoresizingMaskIntoConstraints = false
        self.computerNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: CommonConstraints.top),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CommonConstraints.left),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -CommonConstraints.left),
            
            self.tryLabel.bottomAnchor.constraint(equalTo: self.titleLabel.topAnchor, constant: -CommonConstraints.magin),
            self.tryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CommonConstraints.left),
            self.tryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -CommonConstraints.left),
            
            self.answerTextField.bottomAnchor.constraint(equalTo: self.guessButton.topAnchor, constant: -CommonConstraints.magin),
            self.answerTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CommonConstraints.left),
            self.answerTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -CommonConstraints.left),
            
            self.guessButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.guessButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.guessButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CommonConstraints.left),
            self.guessButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -CommonConstraints.left),
            
            self.computerNumberLabel.topAnchor.constraint(equalTo: self.guessButton.bottomAnchor, constant: CommonConstraints.maginSmall),
            self.computerNumberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CommonConstraints.left),
            self.computerNumberLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -CommonConstraints.left),
        ])

    }
}

