//
//  JuiceMaker - ViewController.swift
//  Created by safari and Red.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let jm: JuiceMaker = JuiceMaker()
        jm.orderJuice(JuiceMaker.Juice.strawberryJuice)
    }


}


