import Foundation

protocol IGuessingByComputerPresenter {
    func loadView(controller: GuessingByComputerViewController, viewScene: IGuessingByComputerView)
}

final class GuessingByComputerPresenter {
    private weak var controller: IGuessingByComputerViewController?
    private weak var viewScene: IGuessingByComputerView?
    private let router: IGuessingByComputerRouter
    private let number: IUserNumber
    private var counter = 1
    private var minimumBorder = 1
    private var maximumBorder = 100
    private var computerNumber: Int
    
    init(number: UserNumber, router: GuessingByComputerRouter) {
        self.router = router
        self.number = number
        self.computerNumber = Int.random(in: self.minimumBorder...self.maximumBorder)
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
        self.viewScene?.setTextLabels(tryCounter: String(self.counter),
                                     question: String( self.computerNumber))
        
        self.viewScene?.pressedSymbolButton = { [weak self] symbol in
            if symbol == ">" {
                self?.numberGreater(self?.computerNumber)
            }
            if symbol == "<" {
                self?.numberLess(self?.computerNumber)
            }
            if symbol == "=" {
                self?.numberEquals(self?.computerNumber)
                guard let counter = self?.counter else {
                    return
                }
                self?.router.nextVC(controller: GuessingByUserAssembly.build(computerCounter: counter))
            }
        }
    }
    
    func numberLess(_ computerNumber: Int?) {
        guard let computerNumber = computerNumber else {
            return
        }
        if computerNumber > self.number.getNumber() {
            self.maximumBorder = self.computerNumber
            self.computerNumber = Int.random(in: self.minimumBorder...self.maximumBorder)
            self.counter += 1
            self.viewScene?.setTextLabels(tryCounter: String(self.counter),
                                          question: String(self.computerNumber))
        } else {
            self.controller?.showAlert(title: DefaultText.myNumberIs + String(self.number.getNumber()),
                                       message: "It is less than the number of the computer")
        }
    }
    
    
    func numberGreater(_ computerNumber: Int?) {
        guard let computerNumber = computerNumber else {
            return
        }
        if computerNumber < self.number.getNumber() {
            self.minimumBorder = self.computerNumber
            self.computerNumber = Int.random(in: self.minimumBorder...self.maximumBorder)
            self.counter += 1
            self.viewScene?.setTextLabels(tryCounter: String(self.counter),
                                          question: String( self.computerNumber))
        } else {
            self.controller?.showAlert(title: DefaultText.myNumberIs + String(self.number.getNumber()),
                                       message: "It is greater than the number of the computer")
        }
    }
    
    func numberEquals(_ computerNumber: Int?) {
        guard let computerNumber = computerNumber else {
            return
        }
        if computerNumber == self.number.getNumber() {
            self.controller?.showAlert(title: "Computer guessed your number " + String(self.number.getNumber()),
                                       message: "Now it's your turn to guess the number")
        }
    }
}

