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
import RxSwift

class SigUpPresenterImpl: SigUpPresenter {
    
    weak var view: SigUpView!
    var userRepository: UserRepository!
    private let disposeBag = DisposeBag()
    
    init(view: SigUpView , userRepository: UserRepository) {
        self.view = view
        self.userRepository = userRepository
    }
    
    func sigUpPresenter(email: String, password: String, name: String) {
        
        // MARK: - firebase realtime
//        Auth.auth().createUser(withEmail: email, password: password) { (users, error) in
//            if let error = error {
//                self.view.sigUpFail(error: error.localizedDescription)
//            }
//            else {
//                 if let currentUser = Auth.auth().currentUser {
//                    currentUser.sendEmailVerification(completion: { (error) in
//                        try! Auth.auth().signOut()
//                        if error == nil {
//                            self.userRepository.sigUp(uid: (users?.user.uid ?? "")! , email : email, name: name )
//                            self.view.sigUp(email: String(currentUser.email!))
//                        }
//                    })
//                }
//            }
//        }
        
        // MARK: - using RX
        self.userRepository.sigUpRx(password: password, email: email, name: name)
            .subscribe { completable in
                switch completable {
                case .completed:
                    self.view.sigUp(email: email)
                case .error(let error):
                    self.view.sigUpFail(error: error.localizedDescription)
                }
        }.disposed(by: disposeBag)
    }
}
