//
//  TextTableViewCell.swift
//  KetoDiet
//
//  Created by Margarita Zherikhova on 07/04/2019.
//  Copyright © 2019 mzherikhova.ru. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell, NibLoadable {

    @IBOutlet private weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        // Initialization code
    }

    func set(text: String) {
        label.text = text
    }
    
}
