import Foundation

protocol IMainMenuPresenter {
    func loadView(controller: MainMenuViewController, viewScene: IMainMenuView)
}

final class MainMenuPresenter {
    private weak var controller: MainMenuViewController?
    private weak var viewScene: IMainMenuView?
    private let router: IMainMenuRouter
    
    init(router: MainMenuRouter) {
        self.router = router
    }
}

extension MainMenuPresenter: IMainMenuPresenter {
    func loadView(controller: MainMenuViewController, viewScene: IMainMenuView) {
        self.controller = controller
        self.viewScene = viewScene
        self.onTouched()
    }
}

private extension MainMenuPresenter {
    func onTouched() {
        self.viewScene?.pressedStartGameButton = { [weak self] in
            self?.router.nextVC(controller: NumberGuessingAssembly.build())
        }
    }
}

