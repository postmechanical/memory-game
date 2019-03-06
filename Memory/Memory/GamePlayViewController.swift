//
//  GamePlayViewController.swift
//  Memory
//
//  Created by Aaron London on 3/5/19.
//  Copyright © 2019 postmechanical. All rights reserved.
//

import UIKit

class GamePlayViewController: UIViewController {
    @IBOutlet var gamePlayView: GamePlayView!
    
    var grid = Grid(width: 0, height: 0)
    var previousSelectedCardView: CardView?
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gamePlayView.setUp(grid)
        gamePlayView.delegate = self
    }
}

extension GamePlayViewController: GamePlayViewDelegate {
    func didSelect(_ cardView: CardView, at indexPath: IndexPath) {
        guard !cardView.isRevealed else { return }
        cardView.reveal()
        guard let previousSelectedCardView = previousSelectedCardView else {
            self.previousSelectedCardView = cardView
            return
        }
        if previousSelectedCardView.card.type != cardView.card.type {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                previousSelectedCardView.reset()
                cardView.reset()
            }
        }
        self.previousSelectedCardView = nil
    }
}
