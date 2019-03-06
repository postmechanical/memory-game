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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gamePlayView.setUp(grid)
    }
}
