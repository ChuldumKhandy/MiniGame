import UIKit

protocol INumberGuessingViewController: AnyObject {
    func showAlert(title: String, message: String)
}

final class NumberGuessingViewController: UIViewController {
    private let viewScene: INumberGuessingView
    private let presenter: INumberGuessingPresenter
    
    init(presenter: NumberGuessingPresenter) {
        self.presenter = presenter
        self.viewScene = NumberGuessingView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.presenter.loadView(controller: self, viewScene: self.viewScene)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.addSubview(self.viewScene)
        
        self.viewScene.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.viewScene.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.viewScene.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.viewScene.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.viewScene.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension NumberGuessingViewController: INumberGuessingViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
