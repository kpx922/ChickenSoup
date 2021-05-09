//
//  FirebaseManager.swift
//  ChickenSoup
//
//  Created by Shihchiao Chao on 9/21/20.
//  Copyright © 2020 Shihchiao Chao. All rights reserved.
//

import UIKit
import Firebase

class FirebaseManager {

    static let shared = FirebaseManager()
    private init() {}
    
    
    func uploadAllQuote() {
        let all = "AllQuote"
        let neg = "Negativity"
        let pos = "Positivity"
        let db = Firestore.firestore()
        let allQuote = db.collection(all)
        let negQuote = db.collection(neg)
        let posQuote = db.collection(pos)
        
        Quotations.allQuotes.forEach { (quote) in
            
            let author = quote.author
            let q = quote.quote
            let type = quote.type
            
            let ref = allQuote.document()
            ref.setData([
                "author" : author,
                "quote": q
            ])
            
            let docId = ref.documentID
            
            if type == "N" {
                negQuote.document(docId).setData([
                    "author" : author,
                    "quote": q
                ])
                
            } else {
                posQuote.document(docId).setData([
                    "author" : author,
                    "quote": q
                ])
            }
        }
    }
}
