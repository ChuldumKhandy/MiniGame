import Foundation

protocol IGuessingByComputerPresenter {
    func loadView(controller: GuessingByComputerViewController, viewScene: IGuessingByComputerView)
}

final class GuessingByComputerPresenter {
    private weak var controller: IGuessingByComputerViewController?
    private weak var viewScene: IGuessingByComputerView?
    private let router: IGuessingByComputerRouter
    private let number: IUserNumber
    private var counter: Int
    private var minimumBorder = Border.minimumBorder
    private var maximumBorder = Border.maximumBorder
    private var computerNumber: Int
    
    init(number: UserNumber, router: GuessingByComputerRouter) {
        self.router = router
        self.number = number
        self.computerNumber = Int.random(in: self.minimumBorder...self.maximumBorder)
        self.counter = 1
    }
}

extension GuessingByComputerPresenter: IGuessingByComputerPresenter {
    func loadView(controller: GuessingByComputerViewController, viewScene: IGuessingByComputerView) {
        self.controller = controller
        self.viewScene = viewScene
        self.viewScene?.setTextLabels(tryCounter: String(self.counter),
                                      question: String( self.computerNumber))
        self.onTouched()
    }
}

private extension GuessingByComputerPresenter {
    func onTouched() {
        self.viewScene?.pressedSymbolButton = { [weak self] symbol in
            if symbol == ">" {
                self?.numberGreater(self?.computerNumber)
            }
            if symbol == "<" {
                self?.numberLess(self?.computerNumber)
            }
            if symbol == "=" {
                self?.numberEquals(self?.computerNumber)
            }
        }
    }
    
    func numberLess(_ computerNumber: Int?) {
        guard let computerNumber = computerNumber else {
            return
        }
        if computerNumber > self.number.getNumber() {
            self.maximumBorder = self.computerNumber - 1
            self.computerNumber = Int.random(in: self.minimumBorder...self.maximumBorder)
            self.counter += 1
            self.viewScene?.setTextLabels(tryCounter: String(self.counter),
                                          question: String(self.computerNumber))
        } else {
            self.controller?.showAlert(title: "My number is ... " + String(self.number.getNumber()),
                                       message: "It is less than the number of the computer")
        }
    }
    
    
    func numberGreater(_ computerNumber: Int?) {
        guard let computerNumber = computerNumber else {
            return
        }
        if computerNumber < self.number.getNumber() {
            self.minimumBorder = self.computerNumber + 1
            self.computerNumber = Int.random(in: self.minimumBorder...self.maximumBorder)
            self.counter += 1
            self.viewScene?.setTextLabels(tryCounter: String(self.counter),
                                          question: String( self.computerNumber))
        } else {
            self.controller?.showAlert(title: "My number is ... " + String(self.number.getNumber()),
                                       message: "It is greater than the number of the computer")
        }
    }
    
    func numberEquals(_ computerNumber: Int?) {
        guard let computerNumber = computerNumber else {
            return
        }
        if computerNumber == self.number.getNumber() {
            self.controller?.showAlert(title: "Now it's your turn to guess the number",
                                       message: "Computer guessed your number " + String(self.number.getNumber()))
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.router.nextVC(controller: GuessingByUserAssembly.build(computerCounter: self.counter))
            }
        } else {
            self.controller?.showAlert(title: "My number is ... " + String(self.number.getNumber()),
                                       message: "It is no equals the number of the computer")
        }
    }
}

