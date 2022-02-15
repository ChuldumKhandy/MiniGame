import Foundation

protocol INumberGuessingPresenter {
    func loadView(controller: NumberGuessingViewController, viewScene: INumberGuessingView)
}

final class NumberGuessingPresenter {
    private weak var controller: INumberGuessingViewController?
    private weak var viewScene: INumberGuessingView?
    private let router: INumberGuessingRouter
    
    init(router: NumberGuessingRouter) {
        self.router = router
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
        self.viewScene?.pressedEnterTheNumberButton = { [weak self] textTF in
            guard let numberString = textTF,
                  numberString.isEmpty == false,
                  let number = Int(numberString) else {
                self?.controller?.showAlert(title: DefaultText.attention, message: DefaultText.enterInteger)
                return
            }
            self?.router.nextVC(controller: GuessingByComputerAssembly.build(number: number))
        }
    }
}

