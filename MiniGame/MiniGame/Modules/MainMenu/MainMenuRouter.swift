import UIKit

protocol IMainMenuRouter {
    func setRootController(controller: UIViewController)
    func nextVC(controller: UIViewController)
}

final class MainMenuRouter {
    private var controller: UIViewController?
}

extension MainMenuRouter: IMainMenuRouter {
    func setRootController(controller: UIViewController) {
        self.controller = controller
    }
    func nextVC(controller: UIViewController) {
        self.controller?.navigationController?.pushViewController(controller, animated: true)
    }
}
