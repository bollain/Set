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
    
    var cardPropertiesMatrix: [Int] {
        return [color.rawValue, shape.rawValue, quantity.rawValue, shading.rawValue]
    }
    
    private static var identifierFactory = 0
    let hashValue: Int = {
        identifierFactory += 1
        return identifierFactory
    }()
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    init(color: Color, shape: Shape, quantity: Quantity, shading: Shading) {
        self.color = color
        self.shape = shape
        self.quantity = quantity
        self.shading = shading
    }
    
    enum Color: Int {
        case red = 1
        case blue
        case green
        
        static var options = [Color.red, .blue, .green]
    }
    
    enum Shape: Int {
        case circle = 1
        case triangle
        case square
        
        static var options = [Shape.circle, .triangle, .square]
        
    }
    
    enum Quantity: Int {
        case one = 1
        case two
        case three
        
        static var options = [Quantity.one, .two, .three]
    }
    
    enum Shading: Int {
        case solid = 1
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
