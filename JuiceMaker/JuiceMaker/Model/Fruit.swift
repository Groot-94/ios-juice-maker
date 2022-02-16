//
//  Fruit.swift
//  JuiceMaker
//
//  Created by Jinyoung Kim on 2022/02/15.
//

import Foundation

enum Fruit: Hashable, CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    
    var name: String {
        switch self {
        case .strawberry:
            return "딸기"
        case .banana:
            return "바나나"
        case .pineapple:
            return "파인애플"
        case .kiwi:
            return "키위"
        case .mango:
            return "망고"
        }
    }
}
