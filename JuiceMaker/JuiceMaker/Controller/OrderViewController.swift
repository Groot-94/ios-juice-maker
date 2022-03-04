//
//  JuiceMaker - OrderViewController.swift
//  Created by marisol, mmim.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class OrderViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryBananaJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    
    @IBOutlet weak var viewTransitionButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showCurrentStock()
    }

    private func showCurrentStock() {
        juiceMaker.fruitStore.inventory.keys.forEach {
            switch $0 {
            case .strawberry:
                strawberryStockLabel.text = convertFruitStockToString(.strawberry)
            case .banana:
                bananaStockLabel.text = convertFruitStockToString(.banana)
            case .pineapple:
                pineappleStockLabel.text = convertFruitStockToString(.pineapple)
            case .kiwi:
                kiwiStockLabel.text = convertFruitStockToString(.kiwi)
            default:
                mangoStockLabel.text = convertFruitStockToString(.mango)
            }
        }
    }
    
    private func convertFruitStockToString(_ fruit: Fruit) -> String? {
        guard let currentStock = juiceMaker.fruitStore.inventory[fruit] else {
            return nil
        }
        return String(currentStock)
    }
    
    @IBAction func moveToStockViewButtonClicked(_ sender: UIBarButtonItem) {
        self.presentStockViewController()
    }
    
    private func presentStockViewController() {
        guard let stockViewController = self.storyboard?.instantiateViewController(withIdentifier: "stockViewController") as? StockViewController else {
            return
        }
        stockViewController.modalTransitionStyle = .coverVertical
        stockViewController.modalPresentationStyle = .automatic
        self.present(stockViewController, animated: true, completion: nil)
    }

    @IBAction func orderButtonsClicked(_ sender: UIButton) {
        switch sender {
        case strawberryBananaJuiceOrderButton:
            order(.strawberryBananaJuice)
            showCurrentStock()
        case mangoKiwiJuiceOrderButton:
            order(.mangoKiwiJuice)
            showCurrentStock()
        case strawberryJuiceOrderButton:
            order(.strawberryJuice)
            showCurrentStock()
        case bananaJuiceOrderButton:
            order(.bananaJuice)
            showCurrentStock()
        case pineappleJuiceOrderButton:
            order(.pineappleJuice)
            showCurrentStock()
        case kiwiJuiceOrderButton:
            order(.kiwiJuice)
            showCurrentStock()
        case mangoJuiceOrderButton:
            order(.mangoJuice)
            showCurrentStock()
        default:
            alertUnknownError()
            showCurrentStock()
        }
    }
    
    private func order(_ juice: Juice) {
        do {
            try juiceMaker.makeJuice(by: juice.recipe)
            alertOrderCompletion(juice)
        } catch OrderError.outOfStock {
            alertOutOfStock()
        } catch {
            alertUnknownError()
        }
    }
}

extension OrderViewController {
    private func alertOrderCompletion(_ juice: Juice) {
        let alert = UIAlertController(title: Alert.orderSuccess.title, message: "\(juice) \(Alert.orderSuccess.message)", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: AlertButton.confirm.title, style: .default, handler: nil)
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func alertOutOfStock() {
        let alert = UIAlertController(title: Alert.outOfStock.title, message: Alert.outOfStock.message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: AlertButton.yes.title, style: .default) { action in
            self.presentStockViewController()
        }
        let cancelAction = UIAlertAction(title: AlertButton.no.title, style: .destructive, handler: nil)
        alert.addAction(defaultAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func alertUnknownError() {
        let alert = UIAlertController(title: Alert.unknownError.title, message: Alert.unknownError.message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: AlertButton.confirm.title, style: .default, handler: nil)
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }
}
