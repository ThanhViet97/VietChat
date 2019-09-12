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
}
