import UIKit

final class GuessingByUserAssembly {
    static func build(computerCounter: Int) -> UIViewController {
        let router = GuessingByUserRouter()
        let model = ComputerNumber(computerCounter: computerCounter)
        let presenter = GuessingByUserPresenter(model: model, router: router)
        let controller = GuessingByUserViewController(presenter: presenter)
        router.setRootController(controller: controller)
        return controller
    }
}
