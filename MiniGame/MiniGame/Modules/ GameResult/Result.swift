import Foundation

protocol IResult {
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
}
