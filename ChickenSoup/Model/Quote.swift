//
//  Quote.swift
//  ChickenSoup
//
//  Created by Shihchiao Chao on 6/3/20.
//  Copyright © 2020 Shihchiao Chao. All rights reserved.
//

import Foundation

struct Quote {
    let type: String
    let author: String
    let quote: String
    
    init(type: Quotations.type, author: String = "Anonymous", quote: String) {
        self.type = type.rawValue
        self.author = author
        self.quote = quote
    }
}
