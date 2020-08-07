//
//  QuoteViewController.swift
//  ChickenSoup
//
//  Created by Shihchiao Chao on 5/15/20.
//  Copyright © 2020 Shihchiao Chao. All rights reserved.
//

import UIKit

class QuoteViewController: UIViewController {
    
    let userDefaults = UserDefaults.standard
    
    var backgroundNumber = 1 {
        didSet { backgroundImageView.setBackgroundImage(indexOf: backgroundNumber) }
    }
    var quotationsType: Quotations.type?

    lazy var blurEffect     = UIBlurEffect(style: traitCollection.userInterfaceStyle == .dark ? .systemMaterialDark : .light)
    lazy var blurView       = UIVisualEffectView(effect: blurEffect)
    lazy var vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
    lazy var vibrancyView   = UIVisualEffectView(effect: vibrancyEffect)
    
    var backgroundImageView = CSBackgroundImageView(frame: .zero)
    let closeButton         = CSCloseButton(type: .system)
    var titleLabel          = CSTitleLabel(fontSize: 50, alignment: .center)
    var quotationLabel      = CSTitleLabel(fontSize: 30, alignment: .center)
    var authorLabel         = CSTitleLabel(fontSize: 30, alignment: .right)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        layoutUI()
        
        #if !APPCLIP
        configureCloseButton()
        #endif

        setupContent()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updateBackground()
    }
    
    fileprivate func updateBackground() {
        blurEffect = UIBlurEffect(style: traitCollection.userInterfaceStyle == .dark ? .systemMaterialDark : .light)
        blurView.effect = blurEffect
        
        vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        vibrancyView.effect = vibrancyEffect
    }
    
    fileprivate func setupContent() {
        setupTitle()
        setupRandomQuotation()
    }
    
    fileprivate func setupTitle() {
        guard let type = quotationsType?.rawValue else { return }
        titleLabel.text = "- \(type) -"
    }
    
    fileprivate func setupRandomQuotation() {
        guard let quotationsType = quotationsType else { return }
        let quote: Quote
        
        switch quotationsType {
        case .soupOfTheDay:
            quote = getAndUpdateSODFromUserDefaults()

        case .positivity:
            let rand = Int.random(in: 0..<Quotations.positivity.count)
            quote = Quotations.positivity[rand]
            
        case .negativity:
            let rand = Int.random(in: 0..<Quotations.negativity.count)
            quote = Quotations.negativity[rand]
        }
        
        authorLabel.text = "--- \(quote.author)"
        
        quotationLabel.text = quote.quote
        quotationLabel.sizeToFit()
    }
        
    fileprivate func getAndUpdateSODFromUserDefaults() -> Quote {
        let type = Quotations.type.soupOfTheDay
        
        if let today = userDefaults.object(forKey: type.rawValue + "date") as? Date {
            if Calendar.current.isDateInToday(today) {
                let sod = userDefaults.integer(forKey: type.rawValue + "sod")
                return Quotations.allQuotes[sod]
            }
        }
        
        let date = Date()
        let rand = Int.random(in: 0..<Quotations.allQuotes.count)
        userDefaults.set(date, forKey: type.rawValue + "date")
        userDefaults.set(rand, forKey: type.rawValue + "sod")
        return Quotations.allQuotes[rand]
    }
    
    fileprivate func configure() {
        backgroundImageView.addMotionEffect()
    }
    
    fileprivate func configureCloseButton() {
        let vContentView = vibrancyView.contentView
        vContentView.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: vContentView.topAnchor, constant: 10),
            closeButton.leadingAnchor.constraint(equalTo: vContentView.leadingAnchor, constant: 10),
            closeButton.widthAnchor.constraint(equalToConstant: 50),
            closeButton.heightAnchor.constraint(equalToConstant: 50)
            ])
                                        
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
    }
    
    fileprivate func layoutUI() {
        view.pinSubviewsToEdge(backgroundImageView, blurView)
        vibrancyView.pinToEdge(blurView.contentView)
        
        let vContentView = vibrancyView.contentView
        vContentView.addSubviews(quotationLabel, authorLabel, titleLabel)
        
        NSLayoutConstraint.activate([
            quotationLabel.centerXAnchor.constraint(equalTo: vContentView.centerXAnchor),
            quotationLabel.centerYAnchor.constraint(equalTo: vContentView.centerYAnchor, constant: -40),
            quotationLabel.widthAnchor.constraint(equalTo: vContentView.widthAnchor, constant: -50),
            quotationLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 550),

            authorLabel.topAnchor.constraint(equalTo: quotationLabel.bottomAnchor, constant: 24),
            authorLabel.trailingAnchor.constraint(equalTo: quotationLabel.trailingAnchor, constant: -30),
            authorLabel.heightAnchor.constraint(equalToConstant: 34),
            
            titleLabel.bottomAnchor.constraint(greaterThanOrEqualTo: quotationLabel.topAnchor, constant: -20),
            titleLabel.centerXAnchor.constraint(equalTo: vContentView.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc fileprivate func close() {
        dismiss(animated: true)
    }
}
