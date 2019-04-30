//
//  Extension+UIView.swift
//  KetoDiet
//
//  Created by Margarita Zherikhova on 22/03/2019.
//  Copyright © 2019 mzherikhova.ru. All rights reserved.
//

import UIKit

extension UIView {
    func round() {
        layer.cornerRadius = frame.height / 2
    }
}

extension UIView {
    enum SeparatorPosition: Int {
        case top = 5
        case bottom = 10
    }
    
    func addSeparator(on position: SeparatorPosition, insets: UIEdgeInsets = .zero) {
        let tag = 0x123578 * position.rawValue
        
        guard self.viewWithTag(tag) == nil else {
            return
        }
        
        let separatorView = UIView()
        separatorView.backgroundColor = #colorLiteral(red: 0.7333333333, green: 0.7607843137, blue: 0.7921568627, alpha: 1)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        let height = 0.5
        let verticalFormat = position == .top ? "|[separatorView(\(height))]" : "[separatorView(\(height))]|"
        addSubview(separatorView)
        let constraints = NSLayoutConstraint.constraints(withNewVisualFormat: "H:|-(\(insets.left))-[separatorView]-(\(insets.right))-|,V:\(verticalFormat)", dict: ["separatorView": separatorView])
        addConstraints(constraints)
    }
}
