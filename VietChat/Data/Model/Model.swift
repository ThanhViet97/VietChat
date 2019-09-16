//
//  Model.swift
//  VietChat
//
//  Created by VietPhan on 9/12/19.
//  Copyright © 2019 Phan Thanh Việt. All rights reserved.
//

import UIKit

struct User {
    var email: String
    var id: String
    var name: String
    var password: String
    
    init(email: String, id: String, name: String ,password: String) {
        self.email = email
        self.id = id
        self.name = name
        self.password = password
    }
}

struct Chat {
    var content: String
    var createAt: String
    var user: [User]
    
    init(content: String, createAt: String, user: [User]) {
        self.content = content
        self.createAt = createAt
        self.user = user
    }
}
