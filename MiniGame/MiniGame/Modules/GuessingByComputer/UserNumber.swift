import Foundation

protocol IUserNumber {
    func getNumber() -> Int
}

final class UserNumber {
    private let userNumber: Int
    
    init(userNumber: Int) {
        self.userNumber = userNumber
    }
}

extension UserNumber: IUserNumber {
    func getNumber() -> Int {
        return self.userNumber
    }
}
