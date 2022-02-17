import Foundation

protocol IComputerNumber {
    func setNumber(randomNumber: Int)
    func getNumber() -> Int
    func getCounter() -> Int
}

final class ComputerNumber {
    private let computerCounter: Int
    private var computerNumber: Int?
    
    init(computerCounter: Int) {
        self.computerCounter = computerCounter
    }
}

extension ComputerNumber: IComputerNumber {
    func setNumber(randomNumber: Int) {
        self.computerNumber = randomNumber
    }
    
    func getNumber() -> Int {
        return self.computerNumber ?? 0
    }
    
    func getCounter() -> Int {
        return self.computerCounter
    }
}
