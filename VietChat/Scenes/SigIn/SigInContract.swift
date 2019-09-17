//
//  SigInContract.swift
//  VietChat
//
//  Created by VietPhan on 9/12/19.
//  Copyright © 2019 Phan Thanh Việt. All rights reserved.
//

import UIKit

protocol SigInView: class {
    func sigInPass()
    func sigInFail()
}

protocol SigInPresenter: class {
    func sigInPresenter(email: String , password: String)
}
