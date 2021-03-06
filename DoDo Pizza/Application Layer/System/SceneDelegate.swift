//
//  SceneDelegate.swift
//  DoDo Pizza
//
//  Created by Vitalii Sosin on 05.03.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            self.setup(window)
        }
    }
    
    // MARK: - Window configuration
    private func setup(_ window: UIWindow) {
        let viewController = InitialAssembly.create()
        _ = InitialAssembly.configure(with: viewController)
    
        self.window = window
        self.window?.overrideUserInterfaceStyle = .light
        
        let tabBar = BasicTabBarAssembly.create()
        let basicTabBarModel = BasicTabBarModel.stub(viewController: viewController)
        BasicTabBarAssembly.configure(with: tabBar, data: basicTabBarModel)

        self.window?.rootViewController = tabBar
        self.window?.makeKeyAndVisible()
    }
}

