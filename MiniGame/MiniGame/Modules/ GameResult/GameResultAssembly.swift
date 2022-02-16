import UIKit

final class GameResultAssembly {
    static func build(userCounter: Int, computerCounter: Int) -> UIViewController {
        let router = GameResultRouter()
        let result = Result(userCounter, computerCounter)
        let presenter = GameResultPresenter(model: result, router: router)
        let controller = GameResultViewController(presenter: presenter)
        router.setRootController(controller: controller)
        return controller
    }
}
