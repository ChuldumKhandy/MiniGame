import Foundation

protocol IGuessingByUserPresenter {
    func loadView(controller: GuessingByUserViewController, viewScene: IGuessingByUserView)
}

final class GuessingByUserPresenter {
    private weak var controller: GuessingByUserViewController?
    private weak var viewScene: IGuessingByUserView?
    private let router: IGuessingByUserRouter
    private let computerNumber: IComputerNumber
    private var userNumber: Int
    private var counter: Int
    
    init(computerNumber: ComputerNumber, router: GuessingByUserRouter) {
        self.router = router
        self.computerNumber = computerNumber
        self.computerNumber.setNumber(randomNumber: Int.random(in: Border.minimumBorder...Border.maximumBorder))
        self.userNumber = 0
        self.counter = 1
    }
}

extension GuessingByUserPresenter: IGuessingByUserPresenter {
    func loadView(controller: GuessingByUserViewController, viewScene: IGuessingByUserView) {
        self.controller = controller
        self.viewScene = viewScene
        self.viewScene?.setTextLabels(tryCounter: String(self.counter), computerNumber: "")
        self.onTouched()
    }
}

private extension GuessingByUserPresenter {
    func onTouched() {
        self.viewScene?.pressedGuessButton = { [weak self] userNumber in
            guard let numberString = userNumber,
                  let number = Int(numberString) else {
                self?.controller?.showAlert(title: "Attention", message: "Enter an integer from 1 to 100")
                return
            }
            self?.checkNumber(number)
        }
    }
    
    func checkNumber(_ number: Int) {
        if number <= Border.maximumBorder && number >= Border.minimumBorder {
            self.userNumber = number
            self.numberLess()
            self.numberGreater()
            self.numberEquals()
        } else {
            self.controller?.showAlert(title: "Attention", message: "Enter an integer from 1 to 100")
        }
    }
    
    func numberLess() {
        if self.computerNumber.getNumber() < self.userNumber {
            self.counter += 1
            self.viewScene?.setTextLabels(tryCounter: String(self.counter),
                                          computerNumber: "No, my number is less than yours")
        }
    }
    
    func numberGreater() {
        if self.computerNumber.getNumber() > self.userNumber {
            self.counter += 1
            self.viewScene?.setTextLabels(tryCounter: String(self.counter),
                                          computerNumber: "No, my number is greater than yours")
        }
    }
    
    func numberEquals() {
        if self.computerNumber.getNumber() == self.userNumber {
            self.viewScene?.setTextLabels(tryCounter: String(self.counter),
                                          computerNumber: "Сool, you guessed my number!")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.router.nextVC(controller: GameResultAssembly.build(userCounter: self.counter,
                                                                        computerCounter: self.computerNumber.getCounter()))
            }
        }
    }
}

