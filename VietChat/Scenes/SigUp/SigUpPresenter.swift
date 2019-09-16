//
//  SigUpPresenter.swift
//  VietChat
//
//  Created by VietPhan on 9/16/19.
//  Copyright © 2019 Phan Thanh Việt. All rights reserved.
//

import UIKit
import Firebase

class SigUpPresenterImpl: SigUpPresenter {
    
    var view: SigUpView!
    
    init(view: SigUpView) {
        self.view = view
    }
    
    func sigUpPresenter(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (users, error) in
            if let error = error {
                self.view.sigUpFail(error: error.localizedDescription)
            }
            else {
                 if let currentUser = Auth.auth().currentUser {
                    currentUser.sendEmailVerification(completion: { (error) in
                        try! Auth.auth().signOut()
                        if error == nil {
                            self.view.sigUp(email: String(currentUser.email!))
                        }
                    })
                }
            }
           
        } 
    }
}
