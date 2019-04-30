//
//  TextFieldTableViewCell.swift
//  KetoDiet
//
//  Created by Margarita Zherikhova on 07/04/2019.
//  Copyright © 2019 mzherikhova.ru. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell, NibLoadable {
    
    @IBOutlet weak var textField: UITextField!
    
    var textChanged: ItemClosure<String>?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    private func addTarget() {
        textField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
    
    @objc private func textFieldChanged(sender: UITextField) {
        textChanged?(sender.text ?? "")
    }
    
}
