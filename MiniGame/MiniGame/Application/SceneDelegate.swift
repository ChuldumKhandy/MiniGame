//
//  SceneDelegate.swift
//  MiniGame
//
//  Created by user on 15.02.2022.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else {
            return
        }
        let window = UIWindow(windowScene: scene)
        let navigation = UINavigationController(rootViewController: MainMenuAssembly.build())
        window.rootViewController = navigation
        window.backgroundColor = .white
        self.window = window
        self.window?.makeKeyAndVisible()
    }
}

