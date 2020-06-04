//
//  CSTitleLabel.swift
//  ChickenSoup
//
//  Created by Shihchiao Chao on 4/3/20.
//  Copyright © 2020 Shihchiao Chao. All rights reserved.
//

import UIKit

class CSTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    convenience init(fontSize: CGFloat, alignment: NSTextAlignment = .center) {
        self.init()
        
        font = UIFont(name: FontName.Futura, size: fontSize)
        textAlignment = alignment
    }
    
    fileprivate func configure() {
        lineBreakMode = .byTruncatingTail
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        numberOfLines = 0
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
