//
//  Question.swift
//  Challenge2
//
//  Created by Ale Mohamad on 02/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import Foundation

struct Question {
    var multiplicationFamily: Int
    var multiplier: Int
    var correct: Int
    var wrong: Int
    var first: Int
    var second: Int
    
    init(family: Int, multiplier: Int) {
        self.multiplicationFamily = family
        self.multiplier = multiplier
        
        correct = self.multiplicationFamily * self.multiplier
        
        if Int.random(in: 0...1) == 1 {
            wrong = correct + Int.random(in: 1...10)
            
            first = wrong
            second = correct
        } else {
            wrong = correct - Int.random(in: 1...10)
            
            first = correct
            second = wrong
        }
    }
}
