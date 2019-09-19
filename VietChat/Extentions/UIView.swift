//
//  UIView.swift
//  VietChat
//
//  Created by VietPhan on 9/13/19.
//  Copyright © 2019 Phan Thanh Việt. All rights reserved.
//

import UIKit

extension UIView {
    
    func roundify() {
        clipsToBounds = true
        layer.cornerRadius = frame.height/2
    }
    
    func boder() {
        clipsToBounds = true
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.831372549, green: 0.8274509804, blue: 0.8274509804, alpha: 1)
    }
    
    func boderColor(color: UIColor) {
        clipsToBounds = true
        layer.borderWidth = 1
        layer.borderColor = color.cgColor
    }
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
