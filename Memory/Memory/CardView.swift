//
//  CardView.swift
//  Memory
//
//  Created by Aaron London on 3/5/19.
//  Copyright © 2019 postmechanical. All rights reserved.
//

import UIKit

class CardView: UIView {
    private(set) var card: Card
    let imageView = UIImageView()
    
    var isRevealed: Bool {
        return card.isRevealed
    }

    init(_ card: Card) {
        self.card = card
        super.init(frame: CGRect.zero)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        backgroundColor = nil
        translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "allCardBacks")
        imageView.contentMode = .scaleToFill
        self.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 2.0),
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2.0),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -2.0),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2.0)
            ])
    }
    
    func reveal() {
        card.isRevealed = true
        UIView.transition(with: imageView, duration: 0.2, options: [.curveEaseInOut, .transitionFlipFromLeft], animations: {
            self.imageView.image = self.card.type.image
        }, completion: nil)
    }
    
    func reset() {
        card.isRevealed = false
        UIView.transition(with: imageView, duration: 0.2, options: [.curveEaseInOut, .transitionFlipFromRight], animations: {
            self.imageView.image = UIImage(named: "allCardBacks")
        }, completion: nil)
    }
}
