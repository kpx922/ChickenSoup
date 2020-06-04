//
//  Double+Ext.swift
//  ChickenSoup
//
//  Created by Shihchiao Chao on 4/2/20.
//  Copyright © 2020 Shihchiao Chao. All rights reserved.
//

import Foundation

extension Double {
    func rounded(digits: Int) -> Double {
        let multiplier = pow(10.0, Double(digits))
        return (self * multiplier).rounded() / multiplier
    }
}
