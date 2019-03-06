//
//  CardType.swift
//  Memory
//
//  Created by Aaron London on 3/6/19.
//  Copyright © 2019 postmechanical. All rights reserved.
//

import UIKit

enum CardType: CaseIterable {
    case bat, cat, cow, dragon, garbageMan, ghostDog, hen, horse, pig, spider
    
    var name: String {
        switch self {
        case .bat: return "Bat"
        case .cat: return "Cat"
        case .cow: return "Cow"
        case .dragon: return "Dragon"
        case .garbageMan: return "GarbageMan"
        case .ghostDog: return "GhostDog"
        case .hen: return "Hen"
        case .horse: return "Horse"
        case .pig: return "Pig"
        case .spider: return "Spider"
        }
    }
    
    var image: UIImage? {
        return UIImage(named: "memory\(name)CardFront")
    }
}
