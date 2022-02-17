import UIKit

protocol INumberGuessingRouter {
    func setRootController(controller: UIViewController)
    func nextVC(controller: UIViewController)
}

final class NumberGuessingRouter {
    private var controller: UIViewController?
}

extension NumberGuessingRouter: INumberGuessingRouter {
    func setRootController(controller: UIViewController) {
        self.controller = controller
    }
    func nextVC(controller: UIViewController) {
        self.controller?.navigationController?.pushViewController(controller, animated: true)
    }
}
