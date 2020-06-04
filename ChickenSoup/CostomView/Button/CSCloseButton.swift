//
//  CSButton.swift
//  ChickenSoup
//
//  Created by Shihchiao Chao on 5/27/20.
//  Copyright © 2020 Shihchiao Chao. All rights reserved.
//

import UIKit

class CSCloseButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    fileprivate func configure() {
        backgroundColor = .clear
        setImage(SFSymbols.close, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
