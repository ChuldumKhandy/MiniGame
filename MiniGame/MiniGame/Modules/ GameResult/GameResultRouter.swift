import UIKit

protocol IGameResultRouter {
    func setRootController(controller: UIViewController)
    func nextVC(controller: UIViewController)
}

final class GameResultRouter {
    private var controller: UIViewController?
}

extension GameResultRouter: IGameResultRouter {
    func setRootController(controller: UIViewController) {
        self.controller = controller
    }
    func nextVC(controller: UIViewController) {
        self.controller?.navigationController?.pushViewController(controller, animated: true)
    }
}
