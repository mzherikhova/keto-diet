//
//  Extensions+UINavigationBar.swift
//  KetoDiet
//
//  Created by Margarita Zherikhova on 31/03/2019.
//  Copyright © 2019 mzherikhova.ru. All rights reserved.
//

import UIKit

extension UINavigationBar {
    func makeClear() {
        backgroundColor = .clear
        setBackgroundImage(UIImage(), for: .default)
        shadowImage = UIImage()
    }
}
