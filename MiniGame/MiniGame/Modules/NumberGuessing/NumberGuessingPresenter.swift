import Foundation

protocol INumberGuessingPresenter {
    func loadView(controller: NumberGuessingViewController, viewScene: INumberGuessingView)
}

final class NumberGuessingPresenter {
    private weak var controller: INumberGuessingViewController?
    private weak var viewScene: INumberGuessingView?
    private let router: INumberGuessingRouter
    private let model: INumber
    
    init(router: NumberGuessingRouter) {
        self.router = router
        self.model = Number()
    }
}

extension NumberGuessingPresenter: INumberGuessingPresenter {
    func loadView(controller: NumberGuessingViewController, viewScene: INumberGuessingView) {
        self.controller = controller
        self.viewScene = viewScene
        self.onTouched()
    }
}

private extension NumberGuessingPresenter {
    func onTouched() {
    }
}

