//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Irina Bashkova on 02.07.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions
    ) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        
        let window = UIWindow(windowScene: scene)
        let tabBarController = CustomUITabBarController()
        tabBarController.selectedIndex = 0
    
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        
        self.window = window
    }
    
    
    
    
}
