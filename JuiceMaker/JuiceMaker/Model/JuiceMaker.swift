//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

/// A structure that is in charge of making juice
struct JuiceMaker {
    
    // MARK: - Property
    
    var fruitStore: FruitStoreType
    var availableJuices: [Juice]
    
    // MARK: - Initialize
    
    init(fruitStore: FruitStore, availableJuices: [Juice] = Juice.allCases) {
        self.fruitStore = fruitStore
        self.availableJuices = availableJuices
    }
    
    /// Make a juice if the ingredients are enough at `FruitStore`
    /// and delivers the whether making juice succeeded or failed
    /// to the subject of invoking the method by `handler`.
    func makeJuice(of juice: Juice, result: ((JuiceMakerResult<Error>) -> Void)) {
        guard availableJuices.contains(juice) else {
            result(.fail(error: JuiceMakerError.notAvailable))
            return
        }
        
        do {
            try fruitStore.useStocks(from: juice.recipe)
            result(.success)
        }
        catch FruitStoreError.outOfStock(let outOfStockFruits) {
            result(.fail(error: FruitStoreError.outOfStock(outOfStockFruits)))
        }
        catch {
            result(.fail(error: FruitStoreError.unkown))
        }
    }
    
}
