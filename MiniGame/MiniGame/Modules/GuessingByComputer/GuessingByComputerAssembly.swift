import UIKit

final class GuessingByComputerAssembly {
    static func build(number: Int) -> UIViewController {
        let router = GuessingByComputerRouter()
        let number = UserNumber(userNumber: number)
        let presenter = GuessingByComputerPresenter(number: number, router: router)
        let controller = GuessingByComputerViewController(presenter: presenter)
        router.setRootController(controller: controller)
        return controller
    }
}
