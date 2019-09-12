//
//  Model.swift
//  VietChat
//
//  Created by VietPhan on 9/12/19.
//  Copyright © 2019 Phan Thanh Việt. All rights reserved.
//

import UIKit

struct User: Decodable {
    var email: String
    var id: String
    var name: String
    var password: String
}

struct chat: Decodable {
    var content: String
    var createAt: String
    var user: [User]
}
