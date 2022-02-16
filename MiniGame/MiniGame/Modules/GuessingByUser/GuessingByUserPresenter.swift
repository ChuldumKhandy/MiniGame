import Foundation

protocol IGuessingByUserPresenter {
    func loadView(controller: GuessingByUserViewController, viewScene: IGuessingByUserView)
}

final class GuessingByUserPresenter {
    private weak var controller: GuessingByUserViewController?
    private weak var viewScene: IGuessingByUserView?
    private let router: IGuessingByUserRouter
    private let model: IComputerNumber
    
    init(model: ComputerNumber, router: GuessingByUserRouter) {
        self.router = router
        self.model = model
    }
}

extension GuessingByUserPresenter: IGuessingByUserPresenter {
    func loadView(controller: GuessingByUserViewController, viewScene: IGuessingByUserView) {
        self.controller = controller
        self.viewScene = viewScene
        self.onTouched()
    }
}

private extension GuessingByUserPresenter {
    func onTouched() {
    }
}

