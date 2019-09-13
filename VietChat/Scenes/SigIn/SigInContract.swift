//
//  SigInContract.swift
//  VietChat
//
//  Created by VietPhan on 9/12/19.
//  Copyright © 2019 Phan Thanh Việt. All rights reserved.
//

import UIKit

protocol SigInView {
    func sigInPass()
    func sigInFail()
}

protocol SigInPresenter {
    func sigInPresenter(email: String , password: String)
}
