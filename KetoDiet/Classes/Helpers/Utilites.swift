//
//  Utilites.swift
//  KetoDiet
//
//  Created by Margarita Zherikhova on 25/04/2019.
//  Copyright © 2019 mzherikhova.ru. All rights reserved.
//

import Foundation

func ID() -> String {
    let str = "abfgasidfnopcqwc91423mzkvcxznpeborqwceyr32718137278913"
    let arr = Array(str)
    
    func random() -> String {
        return String(describing: arr[Int.random(in: arr.indices)])
    }
    
    var result = ""
    let countOfCharacters = 24
    for _ in 0..<countOfCharacters {
        result += random()
    }
    
    return result
}

public func onMain(block: @escaping () -> Void) {
    DispatchQueue.main.async {
        block()
    }
}
