import UIKit

protocol INumberGuessingView: UIView {
    var pressedEnterTheNumberButton: ((String?) -> Void)? { get set }
}

final class NumberGuessingView: UIView, INumberGuessingView {
    private let numberTextField = MainTextField()
    private let enterTheNumberButton = MainButton()
    private var constraint = [NSLayoutConstraint]()
    
    var pressedEnterTheNumberButton: ((String?) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customizeView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.customizeView()
    }
}

private extension NumberGuessingView {
    func customizeView() {
        self.backgroundColor = .white
        self.addSubviews()
        self.customizeTextField()
        self.customizeButton()
        self.configureLayout()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.configureLayout),
                                               name: UIDevice.orientationDidChangeNotification,
                                               object: nil)    }
    
    func addSubviews() {
        self.addSubview(self.numberTextField)
        self.addSubview(self.enterTheNumberButton)
    }
    
    func customizeTextField() {
        self.numberTextField.placeholder = "Guess the number"
        self.numberTextField.addTarget(self, action: #selector(self.changeColorButton), for: .editingChanged)
    }
      
    func customizeButton() {
        self.enterTheNumberButton.backgroundColor = .systemBlue
        self.enterTheNumberButton.setTitle("Enter the number", for: .normal)
        self.enterTheNumberButton.addTarget(self, action: #selector(self.pressedButton), for: .touchUpInside)
    }
    
    @objc func pressedButton() {
        self.pressedEnterTheNumberButton?(self.numberTextField.text)
    }
    
    @objc func changeColorButton() {
        if self.numberTextField.hasText {
            self.enterTheNumberButton.backgroundColor = .blue
        }
    }
    
    func setConstraints() {
        self.numberTextField.translatesAutoresizingMaskIntoConstraints = false
        self.enterTheNumberButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.deactivate(self.constraint)
        self.constraint = [
            self.numberTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: CommonConstraints.top * UIScreen.main.bounds.height),
            self.numberTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CommonConstraints.left),
            self.numberTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -CommonConstraints.left),
            
            self.enterTheNumberButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CommonConstraints.left),
            self.enterTheNumberButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -CommonConstraints.left),
            self.enterTheNumberButton.heightAnchor.constraint(equalToConstant: ButtonConstraint.mainHeight),
            self.enterTheNumberButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -CommonConstraints.bottom * UIScreen.main.bounds.height)
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

