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
        messageSendView.boderColor(color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        messageSendView.layer.cornerRadius = 15
        messageSendView.boderColor(color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        messageReseiveView.layer.cornerRadius = 15
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
