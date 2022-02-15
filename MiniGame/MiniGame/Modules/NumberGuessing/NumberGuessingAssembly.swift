import UIKit

final class NumberGuessingAssembly {
    static func build() -> UIViewController {
        let router = NumberGuessingRouter()
        let presenter = NumberGuessingPresenter(router: router)
        let controller = NumberGuessingViewController(presenter: presenter)
        router.setRootController(controller: controller)
        return controller
    }
}
