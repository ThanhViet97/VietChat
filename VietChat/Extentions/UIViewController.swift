//
//  UIViewController.swift
//  VietChat
//
//  Created by VietPhan on 9/13/19.
//  Copyright © 2019 Phan Thanh Việt. All rights reserved.
//

import UIKit

extension UIViewController {
    // Handle NavigationBar
    func translucentNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }

    func titleColerNavigationBar() {
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.init(cgColor: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    // MARK: - Show Alert
    
    func showAlert(_ title: String?,
                   message: String?,
                   style: UIAlertController.Style = .alert,
                   actions: [UIAlertAction] = [UIAlertAction(title: "Ok", style: .cancel, handler: nil)]) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        actions.forEach({ alertController.addAction($0) })
        
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Show ViewController
    
    func showVcWithMain(identifier: String) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: identifier)
        let navController = UINavigationController(rootViewController: vc)
        self.present(navController, animated:true, completion: nil)
    }
    
    // MARK: - dismiss Keyboard
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = true
        view.addGestureRecognizer(tap)
        print(view.addGestureRecognizer(tap))
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
