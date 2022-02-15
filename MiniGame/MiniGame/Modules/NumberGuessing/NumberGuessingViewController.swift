import UIKit

protocol INumberGuessingViewController: AnyObject {
}

final class NumberGuessingViewController: UIViewController {
    private let viewScene: INumberGuessingView
    private let presenter: INumberGuessingPresenter
    
    init(presenter: NumberGuessingPresenter) {
        self.presenter = presenter
        self.viewScene = NumberGuessingView(frame: UIScreen.main.bounds)
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.addSubview(self.viewScene)
    }
}

extension NumberGuessingViewController: INumberGuessingViewController {
}
