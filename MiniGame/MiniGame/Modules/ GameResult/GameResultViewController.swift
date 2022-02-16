import UIKit

final class GameResultViewController: UIViewController {
    private let viewScene: IGameResultView
    private let presenter: IGameResultPresenter
    
    init(presenter: GameResultPresenter) {
        self.presenter = presenter
        self.viewScene = GameResultView(frame: UIScreen.main.bounds)
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
