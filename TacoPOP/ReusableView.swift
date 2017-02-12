//
//  ReusableView.swift
//  TacoPOP
//
//  Created by Andre Boevink on 12/02/2017.
//  Copyright © 2017 Andre Boevink. All rights reserved.
//

import UIKit

protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}
