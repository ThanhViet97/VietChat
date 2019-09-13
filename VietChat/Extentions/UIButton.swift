//
//  UIButton.swift
//  VietChat
//
//  Created by VietPhan on 9/13/19.
//  Copyright © 2019 Phan Thanh Việt. All rights reserved.
//

import UIKit

extension UIButton {
    func activated(_ activated: Bool) {
        isEnabled = activated
        alpha = activated ? 1.0 : 0.5
    }
    
    func setUnderlineTitle(buttonText: String){
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.black,
            .underlineStyle: NSUnderlineStyle.single.rawValue]
        
        let attributeString = NSMutableAttributedString(string: buttonText, attributes: attributes)
        setAttributedTitle(attributeString, for: .normal)
    }
}
