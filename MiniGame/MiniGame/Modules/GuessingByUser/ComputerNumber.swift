import Foundation

protocol IComputerNumber {
}

final class ComputerNumber {
    private let computerCounter: Int
    
    init(computerCounter: Int) {
        self.computerCounter = computerCounter
    }
}

extension ComputerNumber: IComputerNumber{
}
