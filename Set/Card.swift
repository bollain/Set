//
//  Card.swift
//  Set
//
//  Created by Armando Dorantes Bollain y Goytia on 2018-02-09.
//  Copyright © 2018 Armando Dorantes Bollain y Goytia. All rights reserved.
//

import Foundation

struct Card : Hashable {
    
    let color: Color
    let shape: Shape
    let quantity: Quantity
    let shading: Shading
    
    private static var identifierFactory = 0
    let hashValue: Int = {
        identifierFactory += 1
        return identifierFactory
    }()
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    init() {
        color = Color(rawValue: Color.options.count.arc4random)!
        shape = Shape(rawValue: Shape.options.count.arc4random)!
        quantity = Quantity(rawValue: Quantity.options.count.arc4random)!
        shading = Shading(rawValue: Shading.options.count.arc4random)!
    }
    
    enum Color: Int {
        case red = 0
        case blue
        case green
        
        static var options = [Color.red, .blue, .green]
    }
    
    enum Shape: Int {
        case circle = 0
        case triangle
        case square
        
        static var options = [Shape.circle, .triangle, .square]
        
    }
    
    enum Quantity: Int {
        case one = 0
        case two
        case three
        
        static var options = [Quantity.one, .two, .three]
    }
    
    enum Shading: Int {
        case solid = 0
        case stripe
        case empty
        
        static var options = [Shading.solid, .stripe, .empty]
    }
    
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
