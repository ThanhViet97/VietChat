//
//  ChatContract.swift
//  VietChat
//
//  Created by VietPhan on 9/13/19.
//  Copyright © 2019 Phan Thanh Việt. All rights reserved.
//

import UIKit

protocol ChatView: class{
    func fetchDataView(chat: [Chat] )
    func addChatView(chat: Chat )
    func removedChatView(chat: Chat )
}

protocol ChatPresenter: class {
    func sendPresenter(content: String)
    func fetchPresenter()
    func addCharPresenter()
    func removedChatPresenter()
}


