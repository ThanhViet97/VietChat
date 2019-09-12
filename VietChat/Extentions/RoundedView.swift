//
//  RoundedView.swift
//  VietChat
//
//  Created by VietPhan on 9/13/19.
//  Copyright © 2019 Phan Thanh Việt. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 2.0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = self.borderWidth
        }
    }
    @IBInspectable var normalBorderColor: UIColor? {
        didSet {
            self.layer.borderColor = self.normalBorderColor?.cgColor
        }
    }
}
