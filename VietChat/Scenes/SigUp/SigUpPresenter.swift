//
//  SigUpPresenter.swift
//  VietChat
//
//  Created by VietPhan on 9/16/19.
//  Copyright © 2019 Phan Thanh Việt. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SigUpPresenterImpl: SigUpPresenter {
    
    weak var view: SigUpView!
    var userRepository: UserRepository!
    
    init(view: SigUpView , userRepository: UserRepository) {
        self.view = view
        self.userRepository = userRepository
    }
    
    func sigUpPresenter(email: String, password: String, name: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (users, error) in
            if let error = error {
                self.view.sigUpFail(error: error.localizedDescription)
            }
            else {
                 if let currentUser = Auth.auth().currentUser {
                    currentUser.sendEmailVerification(completion: { (error) in
                        try! Auth.auth().signOut()
                        if error == nil {
                            
                            self.userRepository.createNewUser(uid: (users?.user.uid ?? "")! , email : email, name: name )
                            self.view.sigUp(email: String(currentUser.email!))
                        }
                    })
                }
            }
        } 
    }
}
