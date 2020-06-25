//
//  PurchaseManager.swift
//  ChickenSoup
//
//  Created by Shihchiao Chao on 5/2/20.
//  Copyright © 2020 Shihchiao Chao. All rights reserved.
//

import StoreKit

typealias CompletionHandler = (_ success: Bool) -> Void

class PurchaseManager: NSObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    static let shared = PurchaseManager()
    let IAPRemoveAds = "Joe.ChickenSoup.removeAds"

    var productsRequest: SKProductsRequest!
    var products = [SKProduct]()
    var transactionComplete: CompletionHandler?
    
    func fetchProducts() {
        let productIds = NSSet(object: IAPRemoveAds) as! Set<String>
        productsRequest = SKProductsRequest(productIdentifiers: productIds)
        productsRequest.delegate = self
        productsRequest.start()
    }
    
    func restorePurchases(completion: @escaping CompletionHandler) {
        if SKPaymentQueue.canMakePayments() {
            transactionComplete = completion
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().restoreCompletedTransactions()
            
        } else {
            completion(false)
        }
    }
    
    func purchaseRemoveAds(completion: @escaping CompletionHandler) {
        print("purchasing remove ads")
        if SKPaymentQueue.canMakePayments() && products.count > 0 {
            transactionComplete = completion
            
            let removeAdsProduct = products[0]
            let payment = SKPayment(product: removeAdsProduct)
            
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().add(payment)
            
        } else {
            completion(false)
        }
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if response.products.count > 0 {
            products = response.products
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        print("payment queue")
        transactions.forEach({
            switch $0.transactionState {
                
            case .purchased:
                SKPaymentQueue.default().finishTransaction($0)
                if $0.payment.productIdentifier == IAPRemoveAds {
                    UserDefaults.standard.set(true, forKey: IAPRemoveAds)
                    transactionComplete?(true)
                }
                
            case .failed:
                SKPaymentQueue.default().finishTransaction($0)
                transactionComplete?(false)

            case .restored:
                SKPaymentQueue.default().finishTransaction($0)
                if $0.payment.productIdentifier == IAPRemoveAds {
                    UserDefaults.standard.set(true, forKey: IAPRemoveAds)
                }
                transactionComplete?(true)

            default:
                transactionComplete?(false)
            }
        })
    }
}
