//
//  AdView.swift
//  ChickenSoup
//
//  Created by Shihchiao Chao on 4/30/20.
//  Copyright © 2020 Shihchiao Chao. All rights reserved.
//

import UIKit
import GoogleMobileAds

class AdView: UIView {
    
    var bannerView = GADBannerView(adSize: kGADAdSizeBanner)
    var removeAdButton = CSRemoveAdButton(type: .system)
    weak var rootviewController: UIViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    func setupAd(rootViewController: UIViewController? = nil) {
        if self.rootviewController == nil {
            self.rootviewController = rootViewController
        }
        
        if UserDefaults.standard.bool(forKey: PurchaseManager.shared.IAPRemoveAds) {
            removeAds()
            return
        }
        
        bannerView.adUnitID = AdUnitId.banner.id
        bannerView.delegate = self
        bannerView.rootViewController = rootViewController
        bannerView.load(GADRequest())
    }
    
    fileprivate func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        bannerView.backgroundColor = .clear
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        
        removeAdButton.addTarget(self, action: #selector(handlePurchaseRemoveAds), for: .touchUpInside)
    }
    
    @objc func handlePurchaseRemoveAds() {
        PurchaseManager.shared.purchaseRemoveAds { (success) in
            if success {
                self.removeAds()
            }
        }
    }
    
    func restorePurchases() {
        PurchaseManager.shared.restorePurchases { (success) in
            if success {
                self.setupAd()
            }
        }
    }
    
    fileprivate func removeAds() {
        bannerView.removeFromSuperview()
        removeAdButton.removeFromSuperview()
    }
    
    fileprivate func addBannerView() {
        addSubviews(removeAdButton, bannerView)
        NSLayoutConstraint.activate([
            removeAdButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            removeAdButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            removeAdButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            removeAdButton.heightAnchor.constraint(equalToConstant: 50),
            
            bannerView.bottomAnchor.constraint(equalTo: removeAdButton.topAnchor),
            bannerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bannerView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AdView: GADBannerViewDelegate {
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        addBannerView()
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print("didFailToReceiveAdWithError", error)
    }
}
