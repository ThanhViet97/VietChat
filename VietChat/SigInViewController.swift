//
//  ViewController.swift
//  VietChat
//
//  Created by VietPhan on 9/11/19.
//  Copyright © 2019 Phan Thanh Việt. All rights reserved.
//

import UIKit

class SigInViewController: UIViewController, SigInView  {
    
    
    
    // MARK: - variable
    var presenster : SigInPresenter!
    
    // MARK: - IBOutlet
    @IBOutlet weak var sigInButton: UIButton!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passWordView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var sigUpButton: UIButton!
    @IBOutlet weak var forgotButton: UIButton!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenster = SigInPresenterImpl.init(view: self, userRepository: UserRepositoryImpl.shared)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        prepareUI()
    }
    
    // MARK: - method
    func prepareUI() {
        sigInButton.activated(false)
        forgotButton.setUnderlineTitle(buttonText: "You forgot your email or password ?")
        self.hideKeyboardWhenTappedAround()
    }
    
    func sigInPass() {
        showVcWithMain(identifier: ChatViewController.indentify)
    }
    
    func sigInFail() {
        showAlert("Error", message: "email or password wrong")
    }
    

    // MARK: - IBAction
    @IBAction func sigInAction(_ sender: Any) {
         guard let email = emailTextField.text , let password = passWordTextField.text else {return}
        presenster.sigInPresenter(email: email, password: password)
    }
    
    @IBAction func textEdittingChange(_ sender: Any) {
        guard let email = emailTextField.text , let password = passWordTextField.text else {return}
        sigInButton.activated(email.isValidEmail() && !password.isEmpty)
    }
    
    @IBAction func sigUpAction(_ sender: Any) {
        
    }
    
    @IBAction func forgotAction(_ sender: Any) {
        
    }
    
}

