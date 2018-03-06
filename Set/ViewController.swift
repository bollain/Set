//
//  ViewController.swift
//  Set
//
//  Created by Armando Dorantes Bollain y Goytia on 2018-02-09.
//  Copyright © 2018 Armando Dorantes Bollain y Goytia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var setEngine = Set()
    @IBOutlet var cardButtons: [CardButton]!
    
    @IBAction func selectCard(_ cardButton: CardButton) {
        cardButton.stateOfCardButton = .selected
        
        if selectedCards.count == 3 {
            if isSet {
                //replace selected cards
                if var newCards = setEngine.drawCards() {
                    let indexSelected = selectedCards.map { cardButtons.index(of: $0)  }
                    for index in indexSelected {
                        cardButtons[index!].card = newCards.popLast()
                    }
                } else {
                    //If no cards left in deck
                    selectedCards.forEach { $0.stateOfCardButton = .faceDown}
                }
                
            } else {
                selectedCards.forEach { $0.stateOfCardButton = .unselected}
            }
        }
    }
    
    
    @IBAction func dealCards(_ sender: UIButton) {
    }
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var selectedCards: [CardButton] {
        return cardButtons.filter { $0.stateOfCardButton == .selected}
    }
    
    var isSet: Bool {
        return true//setEngine.checkForSet(selectedCards.map{ $0.card! })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }
    
    func startNewGame(){
        cardButtons.forEach { $0.card = nil}
        setEngine = Set()
        
        for index in (setEngine.dealtCards?.indices)! {
            let card = setEngine.dealtCards![index]
            let cardButton = cardButtons[index]
            cardButton.card = card
            
            cardButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}


