//
//  ManageStockViewController.swift
//  JuiceMaker
//
//  Created by Eunsoo KIM on 2021/10/26.
//

import UIKit

class ManageStockViewController: UIViewController {

    var deliverdAllStock = [String]()
    var juiceMaker: JuiceMaker?
    
    @IBOutlet weak var strawberryQuantityLabel: UILabel!
    @IBOutlet weak var bananaQuantityLabel: UILabel!
    @IBOutlet weak var pineappleQuantityLabel: UILabel!
    @IBOutlet weak var kiwiQuantityLabel: UILabel!
    @IBOutlet weak var mangoQuantityLabel: UILabel!
    
    @IBOutlet weak var strawberryQuantityStepper: UIStepper!
    @IBOutlet weak var bananaQuantityStepper: UIStepper!
    @IBOutlet weak var pineappleQuantityStepper: UIStepper!
    @IBOutlet weak var kiwiQuantityStepper: UIStepper!
    @IBOutlet weak var mangoQuantityStepper: UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = .systemGray5
        
        strawberryQuantityLabel.text = deliverdAllStock[0]
        bananaQuantityLabel.text = deliverdAllStock[1]
        pineappleQuantityLabel.text = deliverdAllStock[2]
        kiwiQuantityLabel.text = deliverdAllStock[3]
        mangoQuantityLabel.text = deliverdAllStock[4]
        
        strawberryQuantityStepper.value = Double(Int(strawberryQuantityLabel.text ?? "0") ?? 0)
        bananaQuantityStepper.value = Double(Int(bananaQuantityLabel.text ?? "0") ?? 0)
        pineappleQuantityStepper.value = Double(Int(pineappleQuantityLabel.text ?? "0") ?? 0)
        kiwiQuantityStepper.value = Double(Int(kiwiQuantityLabel.text ?? "0") ?? 0)
        mangoQuantityStepper.value = Double(Int(mangoQuantityLabel.text ?? "0") ?? 0)
    }
    
    @IBAction func touchUpDismissButton(_ sender: UIBarButtonItem) {
        updateStock()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        fetchLabel(sender.tag).text = String(Int(sender.value))
    }
    
    func fetchLabel (_ tag: Int) -> UILabel {
        switch tag {
        case 0:
            return strawberryQuantityLabel
        case 1:
            return bananaQuantityLabel
        case 2:
            return pineappleQuantityLabel
        case 3:
            return kiwiQuantityLabel
        case 4:
            return mangoQuantityLabel
        default:
            return strawberryQuantityLabel
        }
    }
    
    func updateStock() {
        let updateArray: [Fruit] = [Fruit(name: .strawberry, quantity: Int(strawberryQuantityLabel.text ?? "0") ?? 0),
                                    Fruit(name: .banana, quantity: Int(bananaQuantityLabel.text ?? "0") ?? 0),
                                    Fruit(name: .pineapple, quantity: Int(pineappleQuantityLabel.text ?? "0") ?? 0),
                                    Fruit(name: .kiwi, quantity: Int(kiwiQuantityLabel.text ?? "0") ?? 0),
                                    Fruit(name: .mango, quantity: Int(mangoQuantityLabel.text ?? "0") ?? 0)]
        juiceMaker?.updateStock(to: updateArray)
    }
    
}
