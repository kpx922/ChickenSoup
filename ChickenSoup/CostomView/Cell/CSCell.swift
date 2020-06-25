//
//  CSCell.swift
//  ChickenSoup
//
//  Created by Shihchiao Chao on 4/1/20.
//  Copyright © 2020 Shihchiao Chao. All rights reserved.
//

import UIKit

class CSCell: UITableViewCell {
    static let cellId = "CSCellId"
    
    var backgroundNumber = 1 {
        didSet {
            backgroundImageView.setBackgroundImage(indexOf: backgroundNumber)
        }
    }
    
    var backgroundImageView = CSBackgroundImageView(frame: .zero)
    let titleLabel = CSTitleLabel(fontSize: 30)

    lazy var blurEffect = UIBlurEffect(style: traitCollection.userInterfaceStyle == .dark ? .systemMaterialDark : .light)
    lazy var blurView = UIVisualEffectView(effect: blurEffect)

    lazy var vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
    lazy var vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
    let fillLayer = CAShapeLayer()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        layoutUI()
    }
    
    func setup(_ indexPath: IndexPath, backgroundNum: Int = 1) {
        backgroundNumber = backgroundNum
        
        blurEffect = UIBlurEffect(style: traitCollection.userInterfaceStyle == .dark ? .systemMaterialDark : .light)
        blurView.effect = blurEffect
        
        vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        vibrancyView.effect = vibrancyEffect
        
        titleLabel.text  = Title.cellTitles[indexPath.item]
        addFillLayer()
    }
        
    // FIXME:- If Dark Mode Change (need to change fillColor)
    fileprivate func addFillLayer() {
        fillLayer.removeFromSuperlayer()
        
        let width = frame.width
        let height = frame.height
        let viewWidth = min(width - 50, 600)
        let viewHeight = height - 24
        
        let cellPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: width, height: height), cornerRadius: 0)
        let rect = CGRect(x: (width - viewWidth) / 2, y:  (height - viewHeight) / 2, width: viewWidth, height: viewHeight)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 10)
        
        cellPath.append(path)
        cellPath.usesEvenOddFillRule = true
        
        fillLayer.path = cellPath.cgPath
        fillLayer.fillRule = .evenOdd
        
        fillLayer.fillColor = Color.backgroundColor?.cgColor

        layer.addSublayer(fillLayer)
    }
    
    fileprivate func configure() {
        selectionStyle = .none
        backgroundColor = .clear
        
        backgroundImageView.addMotionEffect()
    }
    
    fileprivate func layoutUI() {
        backgroundImageView.pinToEdge(self)
        blurView.pinToEdge(backgroundImageView)
        vibrancyView.pinToEdge(blurView.contentView)
        vibrancyView.contentView.addSubview(titleLabel)
                
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: vibrancyView.contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: vibrancyView.contentView.centerYAnchor),
            titleLabel.widthAnchor.constraint(equalTo: vibrancyView.contentView.widthAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 42)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
