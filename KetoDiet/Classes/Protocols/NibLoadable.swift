//
//  NibLoadable.swift
//  KetoDiet
//
//  Created by Margarita Zherikhova on 21/03/2019.
//  Copyright © 2019 MacBook. All rights reserved.
//

import UIKit

protocol NibLoadable: class {
    static var nib: UINib { get }
}

extension NibLoadable {
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle.init(for: self))
    }
    static var name: String {
        return String(describing: self)
    }
}

extension NibLoadable where Self: UIView {
    static func loadFromNib()-> Self {
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError()
        }
        return view
    }
}
