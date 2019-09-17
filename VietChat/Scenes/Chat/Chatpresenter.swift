//
//  Chatpresenter.swift
//  VietChat
//
//  Created by VietPhan on 9/13/19.
//  Copyright © 2019 Phan Thanh Việt. All rights reserved.
//

import UIKit
import Firebase


class ChatPresenterImpl: ChatPresenter {
    
    weak var view: ChatView!
    var chatReponsitory: ChatReponsitory!
    
    
    init(view: ChatView, chatRepository: ChatReponsitory) {
        self.view = view
        self.chatReponsitory = chatRepository
    }
    
    func sendPresenter(content: String) {
       guard let uid = UserDefaults.standard.string(forKey: IDUserDefault.keyIDUser) , let name = UserDefaults.standard.string(forKey: IDUserDefault.KeyName) else {return}
        self.chatReponsitory.creaeteNewMessage(uid: uid, contentMessage: content, name: name, createAt: "10h11")
        self.chatReponsitory.fetchData()
        self.view.sendView()
    }
}
