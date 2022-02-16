import Foundation

protocol IGameResultPresenter {
    func loadView(controller: GameResultViewController, viewScene: IGameResultView)
}

final class GameResultPresenter {
    private weak var controller: GameResultViewController?
    private weak var viewScene: IGameResultView?
    private let router: IGameResultRouter
    private let model: IResult
    
    init(model: Result, router: GameResultRouter) {
        self.router = router
        self.model = model
    }
}

extension GameResultPresenter: IGameResultPresenter {
    func loadView(controller: GameResultViewController, viewScene: IGameResultView) {
        self.controller = controller
        self.viewScene = viewScene
        self.onTouched()
    }
}

private extension GameResultPresenter {
    func onTouched() {
    }
}

