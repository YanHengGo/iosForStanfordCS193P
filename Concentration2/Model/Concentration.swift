//
//  Concentration.swift
//  Concentration2
//
//  Created by 厳恒 on 2020/05/16.
//  Copyright © 2020 厳恒. All rights reserved.
//

import Foundation

class Concentration{
    var cards = [Card]()
    
    var indexOfOneFaceUpCard : Int?
    {
        get {
            var foundIndex : Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index),"Concentration.choose(at: \(index) ) : chosen index not in the cards")
        if !cards[index].isMmatched {
            if let matchIndex = indexOfOneFaceUpCard , matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMmatched = true
                    cards[index].isMmatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        print("number of card \(numberOfPairsOfCards)")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card,card]
        }
        //FIXME: gen shuffle the cards
    }
    
}
