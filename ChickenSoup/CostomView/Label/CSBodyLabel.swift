//
//  CSBodyLabel.swift
//  ChickenSoup
//
//  Created by Shihchiao Chao on 5/29/20.
//  Copyright © 2020 Shihchiao Chao. All rights reserved.
//

import UIKit

class CSBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init(alignment: NSTextAlignment) {
        self.init(frame: .zero)
        self.textAlignment = alignment
    }
    
    fileprivate func configure() {
        textColor = .secondaryLabel
        font = UIFont(name: FontName.Futura, size: 20)

        adjustsFontSizeToFitWidth = true
        
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//        dynamic type
//        adjustsFontForContentSizeCategory = true

//        use for dynamic type with font name
//        if let customizeFont = UIFont(name: FontName.Futura, size: 20) {
//            let fontMetrics = UIFontMetrics(forTextStyle: .body)
//            font = fontMetrics.scaledFont(for: customizeFont)
//
//        } else {
//            font = UIFont(name: FontName.Futura, size: 20)
//        }
