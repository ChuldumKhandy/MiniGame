import UIKit

final class MainMenuAssembly {
    static func build() -> UIViewController {
        let router = MainMenuRouter()
        let presenter = MainMenuPresenter(router: router)
        let controller = MainMenuViewController(presenter: presenter)
        router.setRootController(controller: controller)
        return controller
    }
}
