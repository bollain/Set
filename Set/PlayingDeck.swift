//
//  PlayingDeck.swift
//  Set
//
//  Created by Armando Dorantes Bollain y Goytia on 2018-02-20.
//  Copyright © 2018 Armando Dorantes Bollain y Goytia. All rights reserved.
//

import Foundation

struct PlayingDeck
{
    private(set) var cards = [Card]()
    
    init() {
        //Setup initial deck of cards
        for _ in 0..<81 {
            let card = Card()
            cards.append(card)
        }
    }
    
    mutating func draw(_ numberOfCards: validDraws = .three) -> [Card]? {
        if cards.count < numberOfCards.rawValue {
            return nil
        }
        
        var cardsDealt = [Card]()
        for _ in 0..<numberOfCards.rawValue {
            cardsDealt.append(cards.remove(at: cards.count.arc4random))
        }
        return cardsDealt
    }
    
    enum validDraws: Int {
        case three = 3
        case twelve = 12
    }
    
    
    
}
