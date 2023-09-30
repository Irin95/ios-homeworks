//
//  CustomUITabBarController.swift
//  Navigation
//
//  Created by Irina Bashkova on 09.07.2023.
//

import UIKit

class CustomUITabBarController: UITabBarController {

    let feedVC = FeedViewController()
    let profileVC = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
//        setTabBarAppearance()   // банер таббара
    }
    
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransition(to: size, with: coordinator)
//
//        setTabBarAppearance()
//    }
    
    private func setupTabBar() {
    
//        let layerBack = CAShapeLayer()
//        layerBack.backgroundColor = UIColor(red: 255, green: 200, blue: 123, alpha: 0.5).cgColor
//        tabBar.layer.insertSublayer(layerBack, at: 1)
        
        feedVC.title = "Лента"
        feedVC.view.backgroundColor = .white
        profileVC.view.backgroundColor = .lightGray
        
        feedVC.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "bubble.right.circle"), tag: 0)
        profileVC.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.crop.circle"), tag: 1)
        
        let navigationFeed = UINavigationController(rootViewController: feedVC)
        let navigationProfile = UINavigationController(rootViewController: profileVC)
        
        self.viewControllers = [navigationFeed, navigationProfile]
    }
    
    private func setTabBarAppearance(){
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            cornerRadius: height / 2
        )
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.backgroundColor = .green
//        tabBar.itemWidth = width / 5
//        tabBar.itemPositioning = .centered
    }

}
