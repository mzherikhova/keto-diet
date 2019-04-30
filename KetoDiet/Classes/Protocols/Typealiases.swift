//
//  Typealiases.swift
//  KetoDiet
//
//  Created by Margarita Zherikhova on 24/03/2019.
//  Copyright © 2019 mzherikhova.ru. All rights reserved.
//

import Foundation

typealias StaticCellProtocol = NibLoadable & HeightContainable
typealias ItemClosure<T> = ((T) -> Void)
typealias OptionalItemClosure<T> = ((T?) -> Void)
typealias VoidClosure = (() -> Void)
typealias ResultHandler<Value> = (Result<Value>) -> Void
