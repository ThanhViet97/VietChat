//
//  ChatViewController.swift
//  VietChat
//
//  Created by VietPhan on 9/11/19.
//  Copyright © 2019 Phan Thanh Việt. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITextViewDelegate, ChatView {
   
    
    
    // MARK: - Variable
    static var indentify = "ChatViewController"
    var presenter: ChatPresenter!
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sentButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var emojiButton: UIButton!
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var composeView: UIView!
    @IBOutlet weak var inputVIew: UIView!
    @IBOutlet weak var shadowInputView: UIView!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.getTableViewCell(identifier: ChatTableViewCell.identifier)
        presenter = ChatPresenterImpl(view: self , chatRepository: ChatReponsitoryImpl.shared)
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "VietChat"
        titleColerNavigationBar()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        prepareUI()
    }
    
    // MARK: - Method
    func prepareUI() {
        shadowInputView.dropShadow(color: .black, opacity: 2, offSet: CGSize(width: -1, height: 1), radius: 2, scale: true)
        // MARK: - set placeholder
        inputTextView.text = "massage"
        inputTextView.textColor = UIColor.lightGray
        sentButton.activated(false)
//        self.hideKeyboardWhenTappedAround()
    }
    
    // MARK: - Edit placeholder textView
    func textViewDidBeginEditing(_ textView: UITextView) {
        if inputTextView.textColor == UIColor.lightGray {
            inputTextView.text = nil
            inputTextView.textColor = UIColor.black
            sentButton.activated(false)
        }
    }

    func textViewDidChange(_ textView: UITextView) {
        sentButton.activated(!inputTextView.text.isEmpty)
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if inputTextView.text.isEmpty {
            inputTextView.text = "massage"
            inputTextView.textColor = UIColor.lightGray
            sentButton.activated(false)
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func sendView() {
        print("send succes")
    }
    
    // MARK: - IBAction
    @IBAction func sendAction(_ sender: Any) {
        view.endEditing(true)
        guard let contentMessage = inputTextView.text else {return}
        presenter.sendPresenter(content: contentMessage)
        inputTextView.text = "massage"
        inputTextView.textColor = UIColor.lightGray
    }
    
    @IBAction func plusAction(_ sender: Any) {
        
    }
    
    @IBAction func cameraAction(_ sender: Any) {
        
    }
    
    @IBAction func emojiAction(_ sender: Any) {
        
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath ) as! ChatTableViewCell
        return cell
    }
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.hideKeyboardWhenTappedAround()
    }
}
