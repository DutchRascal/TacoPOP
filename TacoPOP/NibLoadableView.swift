//
//  NibLoadableView.swift
//  TacoPOP
//
//  Created by Andre Boevink on 12/02/2017.
//  Copyright © 2017 Andre Boevink. All rights reserved.
//

import UIKit

protocol NibLoadableView: class {}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
