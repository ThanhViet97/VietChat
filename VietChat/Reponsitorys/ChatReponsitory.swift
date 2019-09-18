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
    func fetchData(onSuccess : @escaping (_ listData : [Chat]?) -> Void )
    func addChatData(onSuccess : @escaping (_ listData : Chat?) -> Void)
    func removedChatData(onSuccess : @escaping (_ listData : Chat?) -> Void)
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
    
    func fetchData(onSuccess : @escaping (_ listData : [Chat]?) -> Void ) {
        let ref = Database.database().reference()
        ref.child("Chats").observe(.value) { (snapshot) in
            // Get user value
            var chats = [Chat]()
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot {
                    let chat = Chat(snapshot: snapshot)
                    chats.append(chat!)
                }
                else{
                    print("fail")
                }
            }
            onSuccess(chats)
        }
    }
    
    func addChatData(onSuccess : @escaping (_ listData : Chat?) -> Void) {
        let ref = Database.database().reference()
        ref.child("Chats").observe(.childAdded) { (snapshot) in
            let chat = Chat(snapshot: snapshot)
            onSuccess(chat)
        }
    }
    
    func removedChatData(onSuccess : @escaping (_ listData : Chat?) -> Void){
        let ref = Database.database().reference()
        ref.child("Chats").observe(.childRemoved) { (snapshot) in
            let chat = Chat(snapshot: snapshot)
            onSuccess(chat)
        }
    }
    
}
