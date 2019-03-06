//
//  Card.swift
//  Memory
//
//  Created by Aaron London on 3/6/19.
//  Copyright © 2019 postmechanical. All rights reserved.
//

import Foundation

struct Card {
    var isRevealed = false
    let type: CardType
    
    init(_ type: CardType) {
        self.type = type
    }
}
