//
//  Router.swift
//  KetoDiet
//
//  Created by Margarita Zherikhova on 03/03/2019.
//  Copyright © 2019 MacBook. All rights reserved.
//

import UIKit

final class Router {
    static let shared = Router()
    
    private init() {}
    
    func root(_ window: inout UIWindow?) {
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
        window?.makeKeyAndVisible()
        
        let vc = SecureStorageManager.shared.isLoggedIn() ? startControllerAfterAuth : ViewController()
        
        window?.rootViewController = UINavigationController(rootViewController: vc)
    }
    
    var startControllerAfterAuth: UIViewController {
        let mainVC = MainViewController()
        let mainNC = UINavigationController(rootViewController: mainVC)
        let mainTabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 0)
        mainNC.tabBarItem = mainTabBarItem
        
        let tabBarVC = UITabBarController()
        tabBarVC.setViewControllers([mainNC], animated: true)
        return tabBarVC
    }
}
