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
    
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var user_id: UILabel!
    @IBOutlet weak var messageSend: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageSend.layer.borderWidth = 1
        messageSend.layer.borderColor =  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        messageSend.layer.cornerRadius = 15
        messageSend.clipsToBounds = true
        message.intrinsicContentSize.width
    }

 
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
