//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let juicemaker1: JuiceMaker = JuiceMaker()
        juicemaker1.make(.strawberryJuice)
    }


}

