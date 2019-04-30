//
//  StartRouter.swift
//  KetoDiet
//
//  Created by Margarita Zherikhova on 21/03/2019.
//  Copyright © 2019 MacBook. All rights reserved.
//

import UIKit

final class StartRouter {
    static let shared = StartRouter()
    
    private init() {}
    
    func goToRegisterScreen(from source: UIViewController) {
        let vc = RegisterViewController()
        source.navigationController?.pushViewController(vc, animated: true)
    }
    
   func goToLoginScreen(from source: UIViewController) {
        let vc = LoginViewController()
        source.navigationController?.pushViewController(vc, animated: true)
    }
    
    func routeAfterSuccessAuth(from source: UIViewController) {
        let vc = Router.shared.startControllerAfterAuth
        source.present(vc, animated: true, completion: nil)
    }
}
