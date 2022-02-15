import Foundation

protocol IUserNumber {
}

final class UserNumber {
    private let userNumber: Int
    
    init(userNumber: Int) {
        self.userNumber = userNumber
    }
}

extension UserNumber: IUserNumber{
}
