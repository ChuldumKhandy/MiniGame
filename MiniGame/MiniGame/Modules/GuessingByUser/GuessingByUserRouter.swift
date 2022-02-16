import UIKit

protocol IGuessingByUserRouter {
    func setRootController(controller: UIViewController)
    func nextVC(controller: UIViewController)
}

final class GuessingByUserRouter {
    private var controller: UIViewController?
}

extension GuessingByUserRouter: IGuessingByUserRouter {
    func setRootController(controller: UIViewController) {
        self.controller = controller
    }
    func nextVC(controller: UIViewController) {
        self.controller?.navigationController?.pushViewController(controller, animated: true)
    }
}
