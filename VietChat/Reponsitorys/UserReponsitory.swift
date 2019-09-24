//
//  UserReponsitory.swift
//  VietChat
//
//  Created by VietPhan on 9/13/19.
//  Copyright © 2019 Phan Thanh Việt. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseDatabase
import RxSwift

protocol UserRepository {
    func sigUp(uid: String , email: String , name: String)
    func fetchUserDefaut(uid: String)
    
    
    func fetchUserDefautRx(email: String, password: String) -> Observable<DataSnapshot>
    func sigUpRx(password: String , email: String , name: String) -> Completable
}

class UserRepositoryImpl: UserRepository {
    
    static let shared: UserRepository = UserRepositoryImpl()
    private init() { }
    
    
    // MARK: -  sigUp with realtime firebase
    func sigUp(uid: String, email: String, name: String) {
        let ref = Database.database().reference().root
        let user = User(email: email, name: name)
        ref.child("users").child(uid).setValue(user.toAnyObject()) { (error, ref) in
            if let error = error {
                print(error)
                print(uid , email)
            }
            else {
                print("success")
            }
        }
    }
    // MARK: - fetch data user with realtime firebase
    func fetchUserDefaut(uid: String) {
        let ref = Database.database().reference()
        ref.child("users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            
            let email = value?["email"] as? String ?? ""
            let userName = value?["name"] as? String ?? ""
            let user = User(email: email, name: userName)
            // MARK: - save local
            let defaults = UserDefaults.standard
            defaults.set(user.email, forKey: IDUserDefault.keyEmail)
            defaults.set(user.name, forKey: IDUserDefault.KeyName)
            
        }) { (error) in
            print(error.localizedDescription)
        }
        let defaults = UserDefaults.standard
        defaults.set(uid, forKey: IDUserDefault.keyIDUser)
    }
    
    // MARK: - sigUp with react swift
    func sigUpRx(password: String , email: String, name: String) -> Completable {
        return Completable.create { (completable) -> Disposable in
            Auth.auth().createUser(withEmail: email, password: password) { (users, error) in
                if let error = error {
                    return completable(.error(error))
                } else {
                    if let currentUser = Auth.auth().currentUser {
                        currentUser.sendEmailVerification(completion: { (error) in
                            try! Auth.auth().signOut()
                            if error == nil {
                                let ref = Database.database().reference().root
                                let user = User(email: email, name: name)
                                ref.child("users").child((users?.user.uid)!).setValue(user.toAnyObject())
                            }
                        })
                    }
                    completable(.completed)
                }
            }
            return Disposables.create()
        }
    }
    
    // MARK: - fetch data user with react swift
    func fetchUserDefautRx(email: String, password: String) -> Observable<DataSnapshot> {
        return Observable.create { (observer) -> Disposable in
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if error == nil {
                    let ref = Database.database().reference()
                    ref.child("users").child((user?.user.uid)!).observeSingleEvent(of: .value, with: { (snapshot) in
                        // Get user value
                        observer.onNext(snapshot)
                        observer.onCompleted()
                    }) { (error) in
                        observer.onError(error)
                    }
                }
                else {
                    observer.onError(error!)
                }
            }
            return Disposables.create()
        }
    }
}
