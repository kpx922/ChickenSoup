//
//  AlertViewController.swift
//  ChickenSoup
//
//  Created by Shihchiao Chao on 5/28/20.
//  Copyright © 2020 Shihchiao Chao. All rights reserved.
//

import UIKit

class CSAlertView: UIView {
    
    lazy var blurEffect     = UIBlurEffect(style: traitCollection.userInterfaceStyle == .dark ? .systemMaterialDark : .light)
    lazy var blurView       = UIVisualEffectView(effect: blurEffect)
    lazy var vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
    lazy var vibrancyView   = UIVisualEffectView(effect: vibrancyEffect)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        layoutBackground()
    }
    
    func updateBackground() {
        blurEffect = UIBlurEffect(style: traitCollection.userInterfaceStyle == .dark ? .systemMaterialDark : .light)
        blurView.effect = blurEffect

        vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        vibrancyView.effect = vibrancyEffect
    }
    
    fileprivate func configure() {
        backgroundColor = .clear
        layer.cornerRadius = 16
        translatesAutoresizingMaskIntoConstraints = false
        
        blurView.clipsToBounds = true
        blurView.layer.cornerRadius = 16
    }
    
    fileprivate func layoutBackground() {
        blurView.pinToEdge(self)
        vibrancyView.pinToEdge(blurView.contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
