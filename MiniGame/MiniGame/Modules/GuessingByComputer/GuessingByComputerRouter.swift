import UIKit

protocol IGuessingByComputerRouter {
    func setRootController(controller: UIViewController)
    func nextVC(controller: UIViewController)
}

final class GuessingByComputerRouter {
    private var controller: UIViewController?
}

extension GuessingByComputerRouter: IGuessingByComputerRouter {
    func setRootController(controller: UIViewController) {
        self.controller = controller
    }
    func nextVC(controller: UIViewController) {
        self.controller?.navigationController?.pushViewController(controller, animated: true)
    }
}
