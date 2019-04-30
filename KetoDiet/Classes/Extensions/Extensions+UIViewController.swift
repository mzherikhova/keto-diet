//
//  Extensions+UIViewController.swift
//  KetoDiet
//
//  Created by Margarita Zherikhova on 07/04/2019.
//  Copyright © 2019 mzherikhova.ru. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(with title: String, and message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
