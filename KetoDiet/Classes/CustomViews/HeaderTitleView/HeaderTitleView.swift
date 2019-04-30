//
//  HeaderTitleView.swift
//  KetoDiet
//
//  Created by Margarita Zherikhova on 31/03/2019.
//  Copyright © 2019 mzherikhova.ru. All rights reserved.
//

import UIKit

class HeaderTitleView: UIView, NibLoadable {
    @IBOutlet private weak var label: UILabel!
    
    func set(title: String) {
        label.text = title
    }
}
