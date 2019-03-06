//
//  GamePlayView.swift
//  Memory
//
//  Created by Aaron London on 3/5/19.
//  Copyright © 2019 postmechanical. All rights reserved.
//

import UIKit

protocol GamePlayViewDelegate: NSObjectProtocol {
    func didSelect(_ cardView: CardView, at indexPath: IndexPath)
}

class GamePlayView: UIView {
    private(set) var didSetUp = false
    private(set) var cardViews = [[CardView]]()
    weak var delegate: GamePlayViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        addGestureRecognizer(tapRecognizer)
    }
    
    func setUp(_ grid: Grid) {
        guard !didSetUp else { return }
        let size = bounds.width / CGFloat(grid.width)
        var h = 0
        while h < grid.height {
            var w = 0
            var row = [CardView]()
            while w < grid.width {
                let cardView = CardView(grid.cards[h][w])
                addSubview(cardView)
                NSLayoutConstraint.activate([
                    cardView.widthAnchor.constraint(equalToConstant: size),
                    cardView.heightAnchor.constraint(equalToConstant: size),
                    cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size * CGFloat(w)),
                    cardView.topAnchor.constraint(equalTo: topAnchor, constant: size * CGFloat(h))
                    ])
                row.append(cardView)
                w += 1
            }
            cardViews.append(row)
            h += 1
        }
        didSetUp = true
    }
    
    @objc func tap(_ recognizer: UITapGestureRecognizer) {
        guard let view = hitTest(recognizer.location(in: self), with: nil) else { return }
        for (r, row) in cardViews.enumerated() {
            for (c, cardView) in row.enumerated() {
                if cardView == view {
                    let indexPath: IndexPath = [c, r]
                    delegate?.didSelect(cardView, at: indexPath)
                    break
                }
            }
        }
    }

}
