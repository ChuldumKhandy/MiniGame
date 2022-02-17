import Foundation

protocol IGameResultPresenter {
    func loadView(controller: GameResultViewController, viewScene: IGameResultView)
}

final class GameResultPresenter {
    private weak var controller: GameResultViewController?
    private weak var viewScene: IGameResultView?
    private let router: IGameResultRouter
    private let result: IResult
    
    init(result: Result, router: GameResultRouter) {
        self.router = router
        self.result = result
    }
}

extension GameResultPresenter: IGameResultPresenter {
    func loadView(controller: GameResultViewController, viewScene: IGameResultView) {
        self.controller = controller
        self.viewScene = viewScene
        self.gameResult()
        self.onTouched()
    }
}

private extension GameResultPresenter {
    func gameResult() {
        var win = ""
        if self.result.getComputerCounter() < self.result.getUserCounter() {
            win = "Computer Win"
        } else {
            win = "You Win"
        }
        self.viewScene?.setTextLabels(userCount: "Your's tries count: " + String(self.result.getUserCounter()),
                                      computerCount: "Computer's tries count: " + String(self.result.getComputerCounter()),
                                      win: win)
    }
    
    func onTouched() {
        self.viewScene?.pressedMainMenuButton = { [weak self] in
            self?.router.nextVC(controller: MainMenuAssembly.build())
        }
    }
}

