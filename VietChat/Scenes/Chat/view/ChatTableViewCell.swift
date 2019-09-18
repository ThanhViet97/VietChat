//
//  ChatTableViewCell.swift
//  VietChat
//
//  Created by VietPhan on 9/11/19.
//  Copyright © 2019 Phan Thanh Việt. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    static let identifier = "ChatTableViewCell"
    
    @IBOutlet weak var messageSendLable: UILabel!
    @IBOutlet weak var userIdLable: UILabel!
    @IBOutlet weak var messageSendView: UIView!
 
    @IBOutlet weak var messageReseiveView: UIView!
    @IBOutlet weak var messageReseiveLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageSendView.boder()
        messageSendView.layer.cornerRadius = 15
        messageReseiveView.boder()
        messageReseiveView.layer.cornerRadius = 15
        
//        self.addSubview(messageSendView)
//        messageSendView.addSubview(userIdLable)
//        self.addSubview(senderImage)
//        self.addSubview(receiverImage)
//        self.addSubview(userIdLable)
//
//        messageSendView.translatesAutoresizingMaskIntoConstraints = false
//        userIdLable.translatesAutoresizingMaskIntoConstraints = false
//        messageSendView.translatesAutoresizingMaskIntoConstraints = false
//        receiverImage.translatesAutoresizingMaskIntoConstraints = false
//        senderImage.translatesAutoresizingMaskIntoConstraints = false
//        constrainCell()
//        receiverImage.roundify()
//        senderImage.roundify()
        
    }
    
//    func constrainCell() {
//
//        messageSendView.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 3/4)
//        messageSendView.leadingAnchor.constraint(equalTo: self.rightAnchor, constant: 10)
//        messageSendView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50)
//        messageSendView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5)
//        messageSendView.bottomAnchor.constraint(equalTo: selectedImage.topAnchor, constant: 10)
////        messageSendView.topAnchor.anchorWithOffset(to: messageSendLable.topAnchor)
////        messageSendView.bottomAnchor.anchorWithOffset(to: messageSendLable.bottomAnchor)
//
//
//        messageSendLable.topAnchor.constraint(equalTo: messageSendView.topAnchor, constant: 10)
//        messageSendLable.bottomAnchor.constraint(equalTo: messageSendView.bottomAnchor, constant: 10)
//        messageSendLable.leadingAnchor.constraint(equalTo: messageSendView.leftAnchor, constant: 15)
//        messageSendLable.trailingAnchor.constraint(equalTo: messageSendView.rightAnchor, constant: 15)
//
//        senderImage.trailingAnchor.constraint(equalTo: self.rightAnchor, constant: 10)
//        senderImage.topAnchor.constraint(equalTo: messageSendView.bottomAnchor, constant: 10)
//        senderImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5)
//        senderImage.leadingAnchor.constraint(equalTo: userIdLable.rightAnchor , constant: 10)
//        senderImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/9)
//        senderImage.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/9)
//
//        userIdLable.trailingAnchor.constraint(equalTo: self.rightAnchor, constant: 10)
//        userIdLable.leadingAnchor.constraint(equalTo: receiverImage.leftAnchor, constant: 10)
//        userIdLable.bottomAnchor.constraint(equalToSystemSpacingBelow: senderImage.bottomAnchor, multiplier: 1)
//        userIdLable.heightAnchor.constraint(equalToConstant: 20)
//
//        userIdLable.leadingAnchor.constraint(equalTo: self.leftAnchor, constant: 10)
//        userIdLable.leadingAnchor.constraint(equalTo: userIdLable.leftAnchor, constant: 10)
//        userIdLable.bottomAnchor.constraint(equalToSystemSpacingBelow: userIdLable.bottomAnchor, multiplier: 1)
//        userIdLable.heightAnchor.constraint(equalTo: userIdLable.heightAnchor, multiplier: 1)
//    }
//
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
