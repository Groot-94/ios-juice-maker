//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore = FruitStore()
    
    func makeJuice(fruitJuice: Juice) {
        let recipe = fruitJuice.recipe
        
        do {
            try fruitStore.canMakeJuice(recipe: recipe)
            deleteStockFromRecipeRequired(recipe: recipe)
        } catch JuiceMakerError.outOfStock {
            print("재고가 없습니다")
        } catch {
            print("알 수 없는 오류입니다")
        }
    }
    
    func deleteStockFromRecipeRequired(recipe: [Fruit: Int]) {
        for (fruit, amount) in recipe {
            fruitStore.changeFruitStock(fruit: fruit, amount: amount)
        }
    }
}
