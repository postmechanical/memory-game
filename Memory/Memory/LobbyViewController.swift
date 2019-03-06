//
//  LobbyViewController.swift
//  Memory
//
//  Created by Aaron London on 3/5/19.
//  Copyright © 2019 postmechanical. All rights reserved.
//

import UIKit

class LobbyViewController: UIViewController {

    @IBAction func back(_ segue: UIStoryboardSegue) { }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let identifier = segue.identifier,
            let grid = Grid(identifier),
            let gamePlayViewController = segue.destination as? GamePlayViewController
            else { return }
        gamePlayViewController.grid = grid
    }

}

