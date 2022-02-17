import Foundation

protocol IResult {
    func getUserCounter() -> Int
    func getComputerCounter() -> Int
}

final class Result {
    private let userCounter: Int
    private let computerCounter: Int
    
    init(_ userCounter: Int, _ computerCounter: Int) {
        self.userCounter = userCounter
        self.computerCounter = computerCounter
    }
}

extension Result: IResult{
    func getUserCounter() -> Int {
        return self.userCounter
    }
    
    func getComputerCounter() -> Int {
        return self.computerCounter
    }
}
