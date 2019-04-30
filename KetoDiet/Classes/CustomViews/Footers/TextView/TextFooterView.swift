//
//  TextFooterView.swift
//  KetoDiet
//
//  Created by Margarita Zherikhova on 28/04/2019.
//  Copyright © 2019 mzherikhova.ru. All rights reserved.
//

import UIKit

class TextFooterView: UIView, NibLoadable {
    
    @IBOutlet private weak var textView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(text: String?) {
        textView.text = text
    }
}
