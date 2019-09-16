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
    
    var view: SigInView!
    
    init(view: SigInView) {
        self.view = view
    }
    
    func sigInPresenter(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error == nil {
                self.view.sigInPass()
            }
            else {
                self.view.sigInFail()
            }
        }    
    }
}

