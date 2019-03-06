//
//  GamePlayView.swift
//  Memory
//
//  Created by Aaron London on 3/5/19.
//  Copyright © 2019 postmechanical. All rights reserved.
//

import UIKit

class GamePlayView: UIView {
    private(set) var didSetUp = false
    private(set) var cards = [[CardView]]()

    func setUp(_ grid: Grid) {
        guard !didSetUp else { return }
        let size = bounds.width / CGFloat(grid.width)
        var h = 0
        while h < grid.height {
            var w = 0
            var row = [CardView]()
            while w < grid.width {
                let card = CardView()
                addSubview(card)
                NSLayoutConstraint.activate([
                    card.widthAnchor.constraint(equalToConstant: size),
                    card.heightAnchor.constraint(equalToConstant: size),
                    card.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size * CGFloat(w)),
                    card.topAnchor.constraint(equalTo: topAnchor, constant: size * CGFloat(h))
                    ])
                row.append(card)
                w += 1
            }
            cards.append(row)
            h += 1
        }
        didSetUp = true
    }

}
