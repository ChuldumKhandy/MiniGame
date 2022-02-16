import UIKit

protocol IGuessingByComputerView: UIView {
    var pressedSymbolButton: ((String) -> Void)? { get set }
    
    func setTextLabel(tryCounter: String, question: String)
}

final class GuessingByComputerView: UIView {
    private let tryLabel = MainLabel()
    private let titleLabel = MainLabel()
    private let questionLabel = MainLabel()
    private let myNumberLabel = MainLabel()
    private let lessButton = UserButton()
    private let equalsButton = UserButton()
    private let greaterButton = UserButton()
    
    var pressedSymbolButton: ((String) -> Void)?
    
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
    func setTextLabel(tryCounter: String, question: String) {
        self.tryLabel.text = DefaultText.numberTry + tryCounter
        self.questionLabel.text = DefaultText.yourNumberIs + question + "?"
    }
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
        self.addSubview(self.tryLabel)
        self.addSubview(self.titleLabel)
        self.addSubview(self.questionLabel)
        self.addSubview(self.myNumberLabel)
        self.addSubview(self.lessButton)
        self.addSubview(self.equalsButton)
        self.addSubview(self.greaterButton)
    }
    
    func customizeLabels() {
        self.titleLabel.text = DefaultText.computerIsGuessing
        self.myNumberLabel.text = DefaultText.myNumberIs
    }
      
    func customizeButtons() {
        self.lessButton.setImage(DefaultImage.lessthanSymbol, for: .normal)
        self.equalsButton.setImage(DefaultImage.equalSymbol, for: .normal)
        self.greaterButton.setImage(DefaultImage.greaterthanSymbol, for: .normal)
        self.lessButton.addTarget(self, action: #selector(self.pressedButton), for: .touchUpInside)
        self.equalsButton.addTarget(self, action: #selector(self.pressedButton), for: .touchUpInside)
        self.greaterButton.addTarget(self, action: #selector(self.pressedButton), for: .touchUpInside)
        
    }
    
    @objc func pressedButton(_ sender: UserButton) {
        switch sender {
        case self.lessButton:
            self.pressedSymbolButton?("<")
        case self.greaterButton:
            self.pressedSymbolButton?(">")
        case self.equalsButton:
            self.pressedSymbolButton?("=")
        default:
            break
        }
    }
    
    func setConstraints() {
        self.tryLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.questionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.myNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        self.lessButton.translatesAutoresizingMaskIntoConstraints = false
        self.equalsButton.translatesAutoresizingMaskIntoConstraints = false
        self.greaterButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            self.tryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CommonConstraints.left),
            self.tryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -CommonConstraints.left),
            self.tryLabel.bottomAnchor.constraint(equalTo: self.titleLabel.topAnchor, constant: -CommonConstraints.magin),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: CommonConstraints.top),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CommonConstraints.left),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -CommonConstraints.left),
            
            self.questionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CommonConstraints.left),
            self.questionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -CommonConstraints.left),
            self.questionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: CommonConstraints.magin),
            
            self.myNumberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CommonConstraints.left),
            self.myNumberLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -CommonConstraints.left),
            self.myNumberLabel.bottomAnchor.constraint(equalTo: self.equalsButton.topAnchor, constant: -CommonConstraints.magin),
            
            self.equalsButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.equalsButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -CommonConstraints.bottom),
            self.equalsButton.widthAnchor.constraint(equalToConstant: ButtonConstraint.userHeight),
            self.equalsButton.heightAnchor.constraint(equalToConstant: ButtonConstraint.userHeight),
            
            self.greaterButton.trailingAnchor.constraint(equalTo: self.equalsButton.leadingAnchor, constant: -CommonConstraints.maginSmall),
            self.greaterButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -CommonConstraints.bottom),
            self.greaterButton.widthAnchor.constraint(equalToConstant: ButtonConstraint.userHeight),
            self.greaterButton.heightAnchor.constraint(equalToConstant: ButtonConstraint.userHeight),
            
            self.lessButton.leadingAnchor.constraint(equalTo: self.equalsButton.trailingAnchor, constant: CommonConstraints.maginSmall),
            self.lessButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -CommonConstraints.bottom),
            self.lessButton.widthAnchor.constraint(equalToConstant: ButtonConstraint.userHeight),
            self.lessButton.heightAnchor.constraint(equalToConstant: ButtonConstraint.userHeight)
        ])
    }
}
