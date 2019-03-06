//
//  Grid.swift
//  Memory
//
//  Created by Aaron London on 3/5/19.
//  Copyright © 2019 postmechanical. All rights reserved.
//

import Foundation

struct Grid {
    let width: UInt
    let height: UInt
    
    var cards: [[Card]] {
        var sourceCards = [Card]()
        for _ in 0..<(Int(width * height) / 2) {
            guard let type = CardType.allCases.randomElement() else { continue }
            let card = Card(type)
            sourceCards.append(card)
            sourceCards.append(card)
        }
        var cards = [[Card]]()
        var usedSourceCardIndexes = [Int]()
        var h = 0
        while h < height {
            var w = 0
            var row = [Card]()
            while w < width {
                var index = Int.random(in: 0..<sourceCards.count)
                while usedSourceCardIndexes.contains(index) {
                    index = Int.random(in: 0..<sourceCards.count)
                }
                usedSourceCardIndexes.append(index)
                let c = sourceCards[index]
                row.append(c)
                w += 1
            }
            cards.append(row)
            h += 1
        }
        return cards
    }
    
    init(width: UInt, height: UInt) {
        self.width = width
        self.height = height
    }
    
    init?(_ aString: String) {
        let comps = aString.replacingOccurrences(of: " ", with: "").split(separator: "x")
        guard
            comps.count == 2,
            let aWidth = UInt(comps[0]),
            let aHeight = UInt(comps[1])
            else { return nil }
        width = aWidth
        height = aHeight
    }
}
