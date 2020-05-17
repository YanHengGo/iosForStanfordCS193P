//
//  Card.swift
//  Concentration2
//
//  Created by 厳恒 on 2020/05/16.
//  Copyright © 2020 厳恒. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMmatched = false
    var identifier:Int
    
    static var identifierFactory = 0
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
}
