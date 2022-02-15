//
//  FruitStoreTests.swift
//  FruitStoreTests
//
//  Created by 김정상 on 2022/02/16.
//

import XCTest
@testable import JuiceMaker

class FruitStoreTests: XCTestCase {
    
    // MARK: - Property
    
    private var fruitStore: FruitStore?
    
    
    // MARK: - Overrides
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        fruitStore = FruitStore()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        fruitStore = nil
    }
    
    
    // MARK: - Test codes

    func test_인벤토리보다_적은과일을_사용했을때_성공을_반환하는가() {
        // given
        guard var fruitStore = fruitStore else {
            XCTFail()
            return
        }
        let input: [FruitType: Int] = [
            .banana: 5,
            .strawberry: 5
        ]
        let expected: [FruitType: Int] = [
            .strawberry: 5,
            .banana: 5,
            .pineapple: 10,
            .kiwi: 10,
            .mango: 10
        ]
               
        // when
        let writeResult = fruitStore.use(of: input)
 
        // then
        switch writeResult {
        case .success(_):
            XCTAssertEqual(fruitStore.inventory, expected)
        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }
    
    func test_인벤토리보다_많은과일을_사용했을때_실패을_반환하는가() {
        // given
        guard var fruitStore = fruitStore else {
            XCTFail()
            return
        }
        let input: [FruitType: Int] = [
            .banana: 5,
            .strawberry: 15
        ]
        let expected = FruitStoreError.notEnoughFruits
        
        // when
        let writeResult = fruitStore.use(of: input)
 
        // then
        switch writeResult {
        case .success(_):
            XCTFail()
        case .failure(let error):
            XCTAssertEqual(expected, error)
        }
    }

}
