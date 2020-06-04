//
//  UIView+Ext.swift
//  ChickenSoup
//
//  Created by Shihchiao Chao on 4/1/20.
//  Copyright © 2020 Shihchiao Chao. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach({ self.addSubview($0) })
    }
    
    func pinSubviewsToEdge(_ subviews: UIView...) {
        subviews.forEach({ $0.pinToEdge(self) })
    }
    
    func pinToEdge(_ superview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        superview.addSubview(self)
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])
    }
    
}
