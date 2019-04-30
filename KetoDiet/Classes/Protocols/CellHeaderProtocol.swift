//
//  CellHeaderProtocol.swift
//  KetoDiet
//
//  Created by Margarita Zherikhova on 06/04/2019.
//  Copyright © 2019 mzherikhova.ru. All rights reserved.
//

import Foundation

protocol CellHeaderProtocol {
    associatedtype CellType
    
    var cellModels: [CellType] { get }
}
