//
//  Model.swift
//  VietChat
//
//  Created by VietPhan on 9/12/19.
//  Copyright © 2019 Phan Thanh Việt. All rights reserved.
//

import UIKit
import Firebase

struct User {
    var email: String
    var name: String
    
    init(email: String, name: String) {
        self.email = email
        self.name = name
    }
    
    init?(snapshot: DataSnapshot) {
        guard let value = snapshot.value as? [String: AnyObject],
            let email = value["email"] as? String,
            let name  = value["name"] as? String else
        {return nil}
        self.email = email
        self.name = name
    }
    
    func toAnyObject() -> Any {
        return [
            "email": email,
            "name": name
        ]
    }
}

struct Chat {
    var userIDSend: String
    var content: String
    var createAt: String
    var userSend: User
    
    init(userIDSend: String , content: String, createAt: String, userSend: User) {
        self.userIDSend = userIDSend
        self.content = content
        self.createAt = createAt
        self.userSend = userSend
    }
    
    func toAnyObject() -> Any {
        return [
            "content" : content,
            "createAt" : createAt,
            "userIDSend": userIDSend,
            "userSend" : userSend.toAnyObject()
        ]
    }
}
