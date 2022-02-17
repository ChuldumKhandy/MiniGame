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
        let completion = {
            self.controller?.navigationController?.pushViewController(controller, animated: true)
        }
        guard let coordinator = self.controller?.transitionCoordinator else {
            completion()
            return
        }
        coordinator.animate(alongsideTransition: nil) { _ in
            completion()
        }
    }
}
