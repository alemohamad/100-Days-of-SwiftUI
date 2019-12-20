//
//  Card.swift
//  Flashzilla
//
//  Created by Ale Mohamad on 20/12/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import Foundation

struct Card {
    let prompt: String
    let answer: String
    
    static var example: Card {
        return Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}
