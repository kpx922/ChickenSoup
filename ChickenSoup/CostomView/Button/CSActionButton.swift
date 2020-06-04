//
//  CSActionButton.swift
//  ChickenSoup
//
//  Created by Shihchiao Chao on 5/31/20.
//  Copyright © 2020 Shihchiao Chao. All rights reserved.
//

import UIKit

class CSActionButton: UIButton {
    
    let lineView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        layoutUI()
    }
    
    fileprivate func configure() {
        backgroundColor = .clear
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        
        lineView.backgroundColor = .white
        lineView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func layoutUI() {
        addSubview(lineView)
        
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: topAnchor),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1.5)
        ])
    }
    
    
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
