//
//  Set.swift
//  Set
//
//  Created by Armando Dorantes Bollain y Goytia on 2018-02-09.
//  Copyright © 2018 Armando Dorantes Bollain y Goytia. All rights reserved.
//

import Foundation

class Set {

    let initialDeal = 12
    var deck = PlayingDeck()
    lazy var dealtCards = deck.draw(PlayingDeck.validDraws.twelve)
    var matchedCards = [Card]()
    
}
