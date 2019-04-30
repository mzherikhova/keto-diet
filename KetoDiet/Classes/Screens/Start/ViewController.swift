//
//  ViewController.swift
//  KetoDiet
//
//  Created by Margarita Zherikhova on 03/03/2019.
//  Copyright © 2019 MacBook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        Decorator.decorate(self)
        addTargets()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    private func addTargets() {
        registerButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(signinButtonClicked), for: .touchUpInside)
    }
    
    @objc private func signinButtonClicked() {
        StartRouter.shared.goToLoginScreen(from: self)
    }
    
    @objc private func signUpButtonClicked() {
        StartRouter.shared.goToRegisterScreen(from: self)
    }
}

extension ViewController {
        fileprivate class Decorator {
            private init() {}
            
            static func decorate (_ vc: ViewController) {
                vc.registerButton.layer.cornerRadius = 10
                vc.registerButton.layer.borderWidth = 1
                vc.registerButton.layer.borderColor = #colorLiteral(red: 0.662745098, green: 0.662745098, blue: 0.662745098, alpha: 1)
            }
        }
    }


