//
//  CardView.swift
//  Memory
//
//  Created by Aaron London on 3/5/19.
//  Copyright © 2019 postmechanical. All rights reserved.
//

import UIKit

class CardView: UIView {
    let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
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
}
