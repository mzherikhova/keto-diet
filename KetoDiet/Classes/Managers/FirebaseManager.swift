//
//  FirebaseManager.swift
//  KetoDiet
//
//  Created by Margarita Zherikhova on 25/04/2019.
//  Copyright © 2019 mzherikhova.ru. All rights reserved.
//
import Foundation
import FirebaseDatabase

class FirebaseManager {
    var sourceRef: DatabaseReference {
        return Database.database().reference()
    }
    
    var usersRef: DatabaseReference {
        return sourceRef.child("users")
    }
    
    var chatsRef: DatabaseReference {
        return sourceRef.child("chats")
    }
}

