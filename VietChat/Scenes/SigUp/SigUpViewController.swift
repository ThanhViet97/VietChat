//
//  SigUpViewController.swift
//  VietChat
//
//  Created by VietPhan on 9/16/19.
//  Copyright © 2019 Phan Thanh Việt. All rights reserved.
//

import UIKit

class SigUpViewController: UIViewController , SigUpView {
   
    var presenter: SigUpPresenter!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var sigUpButton: RoundedButton!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SigUpPresenterImpl.init(view: self, userRepository: UserRepositoryImpl.shared)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        translucentNavigationBar()
        prepareUI()
    }
    
    func prepareUI() {
        sigUpButton.activated(false)
        self.hideKeyboardWhenTappedAround()
    }
    
    func sigUp(email: String) {
        let yesAction = UIAlertAction(title: "Yes", style: .destructive, handler: { (alertAction) in
            UIApplication.shared.open(URL(string: "message://")!, options: [:], completionHandler: nil)
        })
        let noAction = UIAlertAction(title: "No", style: .default, handler: { (alertAction) in
            self.navigationController?.popViewController(animated: true)
        })
        self.showAlert("Verification email sent to \(email)", message: "Would you like to open Mail app?", style: .alert, actions: [noAction, yesAction])
    }
    
    func sigUpFail(error: String) {
        self.showAlert("Sign Up Failed", message: error)
    }
    
    @IBAction func textFieldEdittingChange(_ sender: Any) {
        guard let email = emailTextField.text , let password = passwordTextField.text , let name = nameTextField.text else {return}
        sigUpButton.activated(email.isValidEmail() && !password.isEmpty && !name.isEmpty)
    }
    
    @IBAction func sigUpButtonAction(_ sender: Any) {
        guard let email = emailTextField.text , let password = passwordTextField.text, let name = nameTextField.text else {return}
        presenter.sigUpPresenter(email: email, password: password, name: name)
    }
}
