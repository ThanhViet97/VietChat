//
//  ChatViewController.swift
//  VietChat
//
//  Created by VietPhan on 9/11/19.
//  Copyright © 2019 Phan Thanh Việt. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    // MARK: - Variable
    static var indentify = "ChatViewController"
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sentButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var dictationButton: UIButton!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var emojiButton: UIButton!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var composeView: UIView!
    @IBOutlet weak var inputVIew: UIView!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    // MARK: - Method
    func prepareUI() {
        inputVIew.dropShadow(color: .black, opacity: 2, offSet: CGSize(width: -1, height: 1), radius: 2, scale: true)
    }
    
    // MARK: - IBAction
    @IBAction func sendAction(_ sender: Any) {
        
    }
    
    @IBAction func plusAction(_ sender: Any) {
        
    }
    
    @IBAction func dictationAction(_ sender: Any) {
        
    }
    
    @IBAction func cameraAction(_ sender: Any) {
        
    }
    
    @IBAction func emojiAction(_ sender: Any) {
        
    }
    
}
