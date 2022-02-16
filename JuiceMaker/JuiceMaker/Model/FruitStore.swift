//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct FruitStore {
    private var fruits: [Fruit: Int]
    
    mutating func increase(in fruit: Fruit) {
        guard let value = fruits[fruit] else {
            return
        }
        
        self.fruits[fruit] = value + 1
    }
    
    mutating func decrease(in fruit: Fruit) {
        guard let value = fruits[fruit], value > 0 else {
            return
        }
        
        self.fruits[fruit] = value - 1
    }
    
    private func isEnough(of ingredient: Ingredient) throws {
        let fruit = ingredient.fruit
        let number = ingredient.number
        
        guard let value = fruits[fruit], value - number >= 0 else {
            throw
        }
    }
    
    func takeOrder(of ingredients: [Ingredient]) throws {
        try ingredients.forEach { ingredient in
            try isEnough(of: ingredient)
        }
    }
}
