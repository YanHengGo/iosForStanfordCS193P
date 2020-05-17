//
//  ViewController.swift
//  Concentration2
//
//  Created by 厳恒 on 2020/05/16.
//  Copyright © 2020 厳恒. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //ゲーム初期化
    lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    // カードペアの数
    var numberOfPairsOfCards: Int {
        get {
            return (cardButtons.count + 1 ) / 2
        }
    }
    
    var flipCount = 0{
        didSet{
            flipCountLable.text = "Flips:\(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLable: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton){
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was no in cardButton")
        }
    }
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle ( emoji(for: card) , for : UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMmatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    func flipCard(withEmoji emoji: String , on button : UIButton)  {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    var emojiChoices = ["👺","😱","🙀","😈","🎃","👻","🤡","👄","💀"]
    var emoji = [Int:String]()
    
    func emoji(for card : Card) -> String {
        if emoji[card.identifier] == nil , emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}

