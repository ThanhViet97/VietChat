//
//  ChatContract.swift
//  VietChat
//
//  Created by VietPhan on 9/13/19.
//  Copyright © 2019 Phan Thanh Việt. All rights reserved.
//

import UIKit

protocol ChatView: class{
    func sendView()
}

protocol ChatPresenter: class {
    func sendPresenter(content: String)
}


