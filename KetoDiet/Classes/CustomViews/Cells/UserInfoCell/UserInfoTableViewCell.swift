//
//  UserInfoTableViewCell.swift
//  KetoDiet
//
//  Created by Margarita Zherikhova on 23/03/2019.
//  Copyright © 2019 mzherikhova.ru. All rights reserved.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell,StaticCellProtocol {
    
    @IBOutlet weak var backgroundFieldsView: UIView!
    @IBOutlet private weak var photoView: PhotoView!
    @IBOutlet private weak var topTextField: UITextField!
    @IBOutlet private weak var bottomTextField: UITextField!
    
    static var height: CGFloat {
        return 100
    }
    var photoViewClicked: VoidClosure? {
        didSet {
            photoView.clicked = photoViewClicked
        }
    }
    var topTextChanged: ItemClosure<String>?
    var bottomTextChanged: ItemClosure<String>?
    
    private func addTargets() {
        topTextField.addTarget(self, action: #selector(topTextFieldChanged), for: .editingChanged)
        bottomTextField.addTarget(self, action: #selector(bottomTextFieldChanged), for: .editingChanged)    }
    
    @objc private func topTextFieldChanged(sender: UITextField) {
        topTextChanged?(sender.text ?? "")
    }
    @objc private func bottomTextFieldChanged(sender: UITextField) {
        bottomTextChanged?(sender.text ?? "")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        Decorator.decorate(cell: self)
        photoView.clicked = photoViewClicked
        addTargets()
        // Initialization code
    }
    func set(image: UIImage?) {
        photoView.set(image:image)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension UserInfoTableViewCell {
    fileprivate class Decorator {
        static func decorate(cell: UserInfoTableViewCell) {
            cell.selectionStyle = .none
            cell.backgroundColor = .white
            cell.backgroundFieldsView.layer.borderColor = #colorLiteral(red: 0.662745098, green: 0.662745098, blue: 0.662745098, alpha: 1)
            cell.backgroundFieldsView.layer.borderWidth = 0.8
            
        }
    }
}
