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
    
    func chooseCard(at index: Int) {
        let currentState : Bool = cards[index].isFaceUp
        cards[index].isFaceUp = !currentState
        
        if !cards[index].isMmatched {
            if let matchIndex = indexOfOneFaceUpCard , matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMmatched = true
                    cards[index].isMmatched = true
                }
                cards[matchIndex].isFaceUp = true
                indexOfOneFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
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
