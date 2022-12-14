//
//  SceneDelegate.swift
//  DataSourceExample
//
//  Created by muzle on 27.11.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene).apply {
            $0.rootViewController = makeButtonsScene()
            $0.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }
    
    // MARK: - Test methods
    
    private func makeButtonsScene() -> UIViewController {
        let viewModel = ButtonsSceneModel()
        let viewController = ButtonsScene()
        viewController.viewModel = viewModel.asAnyViewModel()
        return UINavigationController(rootViewController: viewController)
    }
}
