//
//  CSBackgroundImageView.swift
//  ChickenSoup
//
//  Created by Shihchiao Chao on 4/3/20.
//  Copyright © 2020 Shihchiao Chao. All rights reserved.
//

import UIKit

class CSBackgroundImageView: UIImageView{
    
    let maxRelativeValue: CGFloat = 24
    let xTransformKeyPath = "layer.transform.translation.x"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    func setBackgroundImage(indexOf num: Int) {
        image = UIImage(named: "background_\(num)") ?? UIImage()
    }
    
    func addMotionEffect() {
        let xMotion = UIInterpolatingMotionEffect(keyPath: xTransformKeyPath, type: .tiltAlongHorizontalAxis)
        xMotion.maximumRelativeValue = maxRelativeValue
        xMotion.minimumRelativeValue = -maxRelativeValue
        
        let motionEffectGroup = UIMotionEffectGroup()
        motionEffectGroup.motionEffects = [xMotion]
        addMotionEffect(motionEffectGroup)
    }
    
    fileprivate func configure() {
        contentMode = .scaleAspectFill
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
