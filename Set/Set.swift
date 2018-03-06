//
//  Set.swift
//  Set
//
//  Created by Armando Dorantes Bollain y Goytia on 2018-02-09.
//  Copyright © 2018 Armando Dorantes Bollain y Goytia. All rights reserved.
//

import Foundation

class Set {
    
    private var deck = PlayingDeck()
    lazy var dealtCards = deck.drawCards(PlayingDeck.validDraws.twelve)
    var matchedCards = [Card]()
    
    
    func checkForSet(_ selectedCards: [Card]) -> Bool {
        guard selectedCards.count == 3 else { return false }
        //Add up raw values for each category (e.g. shape) which are ints
        //if the value added is perfectly divisible by 3 then it meets
        //the criteria for a set in that category
        var categorySums = Array(repeating: 0, count: selectedCards[0].cardPropertiesMatrix.count)
        
        for card in selectedCards {
            let propertiesMatrix = card.cardPropertiesMatrix
            
            for propertyIndex in propertiesMatrix.indices {
                categorySums[propertyIndex] += propertiesMatrix[propertyIndex]
            }
        }
        
        let isSet = categorySums.reduce(true, { $0 && ($1 % 3 == 0)})
        
        if isSet {
            moveCardToMatchedDeck(selectedCards)
        }
        
        return isSet
    }
    
    func moveCardToMatchedDeck(_ cards: [Card]) {
        for card in cards {
            if let card = dealtCards?.remove(at: card.hashValue) {
                matchedCards.append(card)
            }
        }
    }
    
    func drawCards() -> [Card]?
    {
        return deck.drawCards()
    }
    
    
    
}
