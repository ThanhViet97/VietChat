//
//  ChatReponsitory.swift
//  VietChat
//
//  Created by VietPhan on 9/17/19.
//  Copyright © 2019 Phan Thanh Việt. All rights reserved.
//

import UIKit
import Firebase

protocol ChatReponsitory {
    func creaeteNewMessage(uid: String, contentMessage: String, name: String, createAt: String)
    func fetchData()
}

class ChatReponsitoryImpl: ChatReponsitory {
   
    
    
    static let shared: ChatReponsitory = ChatReponsitoryImpl()
    private init() { }
    
    func creaeteNewMessage(uid: String, contentMessage: String, name: String, createAt: String){
        let ref = Database.database().reference()
        let user = User(email: UserDefaults.standard.string(forKey: IDUserDefault.keyEmail)!, name: UserDefaults.standard.string(forKey: IDUserDefault.KeyName)!)
        let chat = Chat(userIDSend: uid , content: contentMessage, createAt: createAt, userSend: user)
        let chatID = ref.childByAutoId().key!
        ref.child("Chats").child(chatID).setValue(chat.toAnyObject())
    }
    
    func fetchData() {
        let ref = Database.database().reference()
        ref.child("Chats").observe(.value) { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary ?? [:]
        }
        
    }
}
