//
//  ChatTableViewCell.swift
//  VietChat
//
//  Created by VietPhan on 9/11/19.
//  Copyright © 2019 Phan Thanh Việt. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    static let identifier = "ChatViewController"
    
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var user_id: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
