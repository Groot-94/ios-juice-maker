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
        
        let juiceMaker = JuiceMaker()
        juiceMaker.takeOrder(.strawberryJuice)
        juiceMaker.takeOrder(.mangoJuice)
        juiceMaker.takeOrder(.mangoJuice)
        juiceMaker.takeOrder(.mangoJuice)
        juiceMaker.takeOrder(.mangoJuice)
    }
}


