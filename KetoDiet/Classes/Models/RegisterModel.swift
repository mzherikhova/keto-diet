//
//  RegisterModel.swift
//  KetoDiet
//
//  Created by Margarita Zherikhova on 07/04/2019.
//  Copyright © 2019 mzherikhova.ru. All rights reserved.
//

import UIKit

class RegisterModel {
    var photo: UIImage?
    var email: String?
    var password: String?
    var sex: Sex = .male
    var birthday: Date?
    var userId: String
    
    var isFilled: Bool {
        guard !(email ?? "").isEmpty, !(password ?? "").isEmpty, birthday != nil else {
            return false
        }
        
        return true
    }
    
    var dict: [String: Any] {
        return [
            "email": email ?? "",
            "password": password ?? "",
            "sex": sex.rawValue,
            "birthday": (birthday ?? Date()).timeIntervalSince1970 // 1010101212010
        ]
    }
    
    init() {
        self.userId = UUID.init().uuidString
    }
}
