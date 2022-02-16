import UIKit

final class GuessingByUserViewController: UIViewController {
    private let viewScene: IGuessingByUserView
    private let presenter: IGuessingByUserPresenter
    
    init(presenter: GuessingByUserPresenter) {
        self.presenter = presenter
        self.viewScene = GuessingByUserView()
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
        self.viewScene.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.viewScene.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.viewScene.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.viewScene.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.viewScene.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
