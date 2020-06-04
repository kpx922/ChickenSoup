//
//  DropDownMenuView.swift
//  ChickenSoup
//
//  Created by Shihchiao Chao on 6/2/20.
//  Copyright © 2020 Shihchiao Chao. All rights reserved.
//

import UIKit

class DropDownMenuView: UIView {

    lazy var blurEffect     = UIBlurEffect(style: traitCollection.userInterfaceStyle == .dark ? .systemMaterialDark : .extraLight)
    lazy var blurView       = UIVisualEffectView(effect: blurEffect)
    lazy var vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
    lazy var vibrancyView   = UIVisualEffectView(effect: vibrancyEffect)
      
    let restoreButton = UIButton(type: .system)
    
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
        layer.cornerRadius = 14
        translatesAutoresizingMaskIntoConstraints = false
        
        restoreButton.setTitle("Restore Purchase", for: .normal)
        restoreButton.titleLabel?.font = UIFont(name: FontName.Futura, size: 20)
        restoreButton.clipsToBounds = true
        restoreButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func layoutUI() {
        blurView.pinToEdge(self)
        vibrancyView.pinToEdge(blurView.contentView)
        vibrancyView.contentView.addSubview(restoreButton)
        
        NSLayoutConstraint.activate([
            restoreButton.centerXAnchor.constraint(equalTo: vibrancyView.contentView.centerXAnchor),
            restoreButton.topAnchor.constraint(equalTo: vibrancyView.contentView.topAnchor, constant: 10),
            restoreButton.bottomAnchor.constraint(equalTo: vibrancyView.contentView.bottomAnchor, constant: -10),
            restoreButton.widthAnchor.constraint(equalTo: vibrancyView.contentView.widthAnchor, constant: -30)

        ])
        
        
//        vibrancyView.contentView.addSubview(restoreButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
