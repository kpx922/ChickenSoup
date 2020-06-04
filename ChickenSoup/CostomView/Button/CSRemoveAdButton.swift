//
//  CSRemoveAdButton.swift
//  ChickenSoup
//
//  Created by Shihchiao Chao on 6/4/20.
//  Copyright © 2020 Shihchiao Chao. All rights reserved.
//

import UIKit

class CSRemoveAdButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    fileprivate func configure() {
        setTitle("Remove Ads", for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        backgroundColor = .systemPink
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
