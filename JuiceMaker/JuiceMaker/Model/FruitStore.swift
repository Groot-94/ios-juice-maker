//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation
import UIKit

class FruitStore {
   
    private(set) var fruitInventory: [Fruits: Int]
    
    static let shared = FruitStore()
    
    private init(defaultStock: Int) {
        self.fruitInventory = [:]
        Fruits.allCases.forEach { fruitInventory[$0] = defaultStock }
    }
    
    private convenience init() {
        self.init(defaultStock: 10)
    }
    
    func add(fruit: Fruits, of count: Int) {
        guard let numberOfFruit = fruitInventory[fruit], count >= 0 else {
            return
        }
        fruitInventory[fruit] = numberOfFruit + count
        NotificationCenter.default.post(name: Notification.Name("changedInventory"), object: nil)
    }
    
    func subtract(fruit: Fruits, of count: Int) {
        guard let numberOfFruit = fruitInventory[fruit], count >= 0 else {
            return
        }
        fruitInventory[fruit] = numberOfFruit - count
        NotificationCenter.default.post(name: Notification.Name("changedInventory"), object: nil)
    }
    
    func hasStock(of fruit: Fruits, count: Int) -> Bool {
        guard let numberOfFruit = fruitInventory[fruit] else {
            return false
        }
        return numberOfFruit >= count
    }
}
