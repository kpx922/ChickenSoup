//
//  CSMenuCloseButton.swift
//  ChickenSoup
//
//  Created by Shihchiao Chao on 6/2/20.
//  Copyright © 2020 Shihchiao Chao. All rights reserved.
//

import UIKit

class CSMenuCloseButtonView: UIView {
    
    lazy var blurEffect     = UIBlurEffect(style: traitCollection.userInterfaceStyle == .dark ? .systemMaterialDark : .extraLight)
    lazy var blurView       = UIVisualEffectView(effect: blurEffect)
    lazy var vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
    lazy var vibrancyView   = UIVisualEffectView(effect: vibrancyEffect)
    
    let closeButton         = CSCloseButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        layoutUI()
    }
    
    func updateBackground() {
        blurEffect = UIBlurEffect(style: traitCollection.userInterfaceStyle == .dark ? .systemMaterialDark : .light)
        blurView.effect = blurEffect

        vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        vibrancyView.effect = vibrancyEffect
    }
    
    fileprivate func configure() {
        clipsToBounds = true
        layer.cornerRadius = 22
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func layoutUI() {
        blurView.pinToEdge(self)
        vibrancyView.pinToEdge(blurView.contentView)
        closeButton.pinToEdge(vibrancyView.contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
