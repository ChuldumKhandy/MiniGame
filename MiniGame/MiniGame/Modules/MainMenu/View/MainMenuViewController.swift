import UIKit

final class MainMenuViewController: UIViewController {
    private let viewScene: IMainMenuView
    private let presenter: IMainMenuPresenter
    
    init(presenter: MainMenuPresenter) {
        self.presenter = presenter
        self.viewScene = MainMenuView()
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
        self.navigationController?.isNavigationBarHidden = true
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
