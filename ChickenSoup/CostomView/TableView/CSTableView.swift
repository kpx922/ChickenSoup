//
//  CSTableView.swift
//  ChickenSoup
//
//  Created by Shihchiao Chao on 5/27/20.
//  Copyright © 2020 Shihchiao Chao. All rights reserved.
//

import UIKit

class CSTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        configure()
    }
    
    fileprivate func configure() {
        register(CSCell.self, forCellReuseIdentifier: CSCell.cellId)
        backgroundColor                           = Color.backgroundColor
        separatorStyle                            = .none
        isScrollEnabled                           = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
