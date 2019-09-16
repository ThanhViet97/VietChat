//
//  SigUpContract.swift
//  VietChat
//
//  Created by VietPhan on 9/16/19.
//  Copyright © 2019 Phan Thanh Việt. All rights reserved.
//

import UIKit

protocol SigUpView {
    func sigUp(email: String)
    func sigUpFail(error: String)
}

protocol SigUpPresenter {
    func sigUpPresenter(email: String, password: String)
}
