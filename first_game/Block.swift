//
//  Block.swift
//  first_game
//
//  Created by Thang Ngoc on 3/29/15.
//  Copyright (c) 2015 Thang Ngoc Tran. All rights reserved.
//

import SpriteKit

// #1
let NumberOfColors: UInt32 = 6

// #2
enum BlockColor: Int, Printable {
    
    // #3
    case Blue = 0, Orange, Purple, Red, Teal, Yellow
    
    // #4
    var spriteName: String {
        switch self {
        case .Blue:
            return "blue"
        case .Orange:
            return "orange"
        case .Purple:
            return "purple"
        case .Red:
            return "red"
        case .Teal:
            return "teal"
        case .Yellow:
            return "yellow"
        }
    }
    
    // #5
    var description: String {
        return self.spriteName
    }
    
    // #6
    static func random() -> BlockColor {
        return BlockColor(rawValue:Int(arc4random_uniform(NumberOfColors)))!
    }
}