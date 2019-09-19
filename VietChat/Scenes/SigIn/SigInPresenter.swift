//
//  SigInPresenter.swift
//  VietChat
//
//  Created by VietPhan on 9/12/19.
//  Copyright © 2019 Phan Thanh Việt. All rights reserved.
//

import UIKit
import Firebase

class SigInPresenterImpl: SigInPresenter  {
    
    weak var view: SigInView!
    var userRepository: UserRepository
    
    init(view: SigInView, userRepository: UserRepository ) {
        self.view = view
        self.userRepository = userRepository
    }
    
    func sigInPresenter(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error == nil {
                self.view.sigInPass()
                self.userRepository.fetchUserDefaut(uid: (user?.user.uid)!)
            }
            else {
                self.view.sigInFail()
            }
        }    
    }
}

