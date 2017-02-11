//
//  MainVC.swift
//  TacoPOP
//
//  Created by Andre Boevink on 11/02/2017.
//  Copyright © 2017 Andre Boevink. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var headerView: HeaderView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView.addDropShadow()

    }

}
