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
