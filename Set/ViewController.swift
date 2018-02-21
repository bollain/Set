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
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func selectCard(_ sender: UIButton) {
        let index = cardButtons.index(of: sender)!
        print("\(index) sent a signal")
    }
    
    @IBAction func dealCards(_ sender: UIButton) {
    }
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }
    
    func initalizeButtons() {
        for button in cardButtons {
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            button.setTitle("", for: UIControlState.normal)
        }
    }
    
    func renderButton(_ button: UIButton){
        
    }
    
    func startNewGame(){
        initalizeButtons()
        setEngine = Set()
        
        for index in (setEngine.dealtCards?.indices)! {
            let button = cardButtons[index]
            let card = setEngine.dealtCards![index]
            
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            let attributedString = cardToAttributedString(card)
            button.setAttributedTitle(attributedString, for: UIControlState.normal)
        }
        
    }
    
    func cardToAttributedString(_ card: Card) -> NSAttributedString {
        let shape = shapes[card.shape]!
        let returnString: String
 
        switch card.quantity {
        case .one: returnString = shape
        case .two: returnString = shape + shape
        case .three: returnString = shape + shape + shape
        }

        
        let attributes: [NSAttributedStringKey: Any] = [
            .strokeColor: colors[card.color]!,
            .foregroundColor: colors[card.color]!.withAlphaComponent(shades[card.shading]!),
            .strokeWidth: fill[card.shading]!
        ]
        
        return NSAttributedString(string: returnString, attributes: attributes)
    }
    
    let shapes: [Card.Shape:String] = [.circle: "●", .square: "■", .triangle: "▲"]
    let colors: [Card.Color:UIColor] = [.blue: #colorLiteral(red: 0, green: 0, blue: 1, alpha: 1), .red: #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1), .green: #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1)]
    let shades: [Card.Shading:CGFloat] = [.empty: 0, .solid: 1, .stripe: 0.15]
    let fill: [Card.Shading:CGFloat] = [.solid: -5, .empty: 5, .stripe: -5]
    
}

