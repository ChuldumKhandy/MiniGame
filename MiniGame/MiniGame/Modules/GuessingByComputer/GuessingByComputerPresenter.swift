import Foundation

protocol IGuessingByComputerPresenter {
    func loadView(controller: GuessingByComputerViewController, viewScene: IGuessingByComputerView)
}

final class GuessingByComputerPresenter {
    private weak var controller: IGuessingByComputerViewController?
    private weak var viewScene: IGuessingByComputerView?
    private let router: IGuessingByComputerRouter
    private let number: IUserNumber
    
    init(number: UserNumber, router: GuessingByComputerRouter) {
        self.router = router
        self.number = number
    }
}

extension GuessingByComputerPresenter: IGuessingByComputerPresenter {
    func loadView(controller: GuessingByComputerViewController, viewScene: IGuessingByComputerView) {
        self.controller = controller
        self.viewScene = viewScene
        self.onTouched()
    }
}

private extension GuessingByComputerPresenter {
    func onTouched() {
    }
}

