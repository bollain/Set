//
//  CardButton.swift
//  Set
//
//  Created by Armando Dorantes Bollain y Goytia on 2018-03-02.
//  Copyright © 2018 Armando Dorantes Bollain y Goytia. All rights reserved.
//

import UIKit

class CardButton: UIButton {
    
    var stateOfCardButton: StateofCard = .unselected {
        didSet {
            switch stateOfCardButton {
            case .selected:
                layer.borderWidth = CardDisplays.selectedBorderWidth
                layer.borderColor = CardDisplays.selectedBorderColor
            case .matched: break
            case .unselected:
                layer.borderWidth = CardDisplays.unselectedBorderWidth
                layer.borderColor = CardDisplays.unselectedBorderColor
            case.faceDown:
                backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
                setTitle("", for: .normal)
            }
        }
    }
    var cardIndex = 0
    var card: Card? {
        didSet {
            if let card = card {
                cardIndex = card.hashValue
                stateOfCardButton = .unselected
                let attributedString = cardToAttributedString(card)
                setAttributedTitle(attributedString, for: .normal)
            } else {
                cardIndex = 0
                stateOfCardButton = .faceDown
                setAttributedTitle(NSAttributedString(), for: .normal)
            }
        }
    }
    
    func cardToAttributedString(_ card: Card) -> NSAttributedString {
        let shape = ModelToView.shapes[card.shape]!
        let returnString: String
        
        switch card.quantity {
        case .one: returnString = shape
        case .two: returnString = shape + shape
        case .three: returnString = shape + shape + shape
        }
        
        let attributes: [NSAttributedStringKey: Any] = [
            .strokeColor: ModelToView.colors[card.color]!,
            .foregroundColor: ModelToView.colors[card.color]!.withAlphaComponent(ModelToView.shades[card.shading]!),
            .strokeWidth: ModelToView.fill[card.shading]!
        ]
        
        return NSAttributedString(string: returnString, attributes: attributes)
    }
    
    enum StateofCard {
        case unselected
        case selected
        case matched
        case faceDown
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
   
    
 

}

struct ModelToView {
    static let shapes: [Card.Shape:String] = [.circle: "●", .square: "■", .triangle: "▲"]
    static let colors: [Card.Color:UIColor] = [.blue: #colorLiteral(red: 0, green: 0, blue: 1, alpha: 1), .red: #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1), .green: #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1)]
    static let shades: [Card.Shading:CGFloat] = [.empty: 0, .solid: 1, .stripe: 0.15]
    static let fill: [Card.Shading:CGFloat] = [.solid: -5, .empty: 5, .stripe: -5]
}

struct CardDisplays {
    static let selectedBorderColor: CGColor = UIColor.blue.cgColor
    static let selectedBorderWidth: CGFloat = 3.0
    static let unselectedBorderColor: CGColor = UIColor.clear.cgColor
    static let unselectedBorderWidth: CGFloat = 0
}
