//
//  CSAlertViewController.swift
//  ChickenSoup
//
//  Created by Shihchiao Chao on 5/29/20.
//  Copyright © 2020 Shihchiao Chao. All rights reserved.
//

import UIKit

protocol CSAlertViewControllerDismissDelegate: class {
    func alertDidDismissed()
}

class CSAlertViewController: UIViewController {

    let containerView = CSAlertView()
    let alertImageView = UIImageView()
    let titleLabel = CSTitleLabel(fontSize: 30, alignment: .center)
    let messageLabel = CSBodyLabel(alignment: .center)
    let actionButton = CSActionButton(type: .system)
    weak var dismissDelegate: CSAlertViewControllerDismissDelegate?
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    let padding: CGFloat = 20
    
    init(type: Alert.type, title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
        
        switch type {
        case .warning:
            alertImageView.image = SFSymbols.warning
        case .error:
            alertImageView.image = SFSymbols.error
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        containerView.updateBackground()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        layoutUI()
    }

    fileprivate func configure() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        
        alertImageView.contentMode = .scaleAspectFill
        alertImageView.clipsToBounds = true
        alertImageView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = alertTitle ?? "Something went wrong"
        
        messageLabel.text = message ?? "Unable to complete request"
        messageLabel.numberOfLines = 4
        
        actionButton.setTitle(buttonTitle ?? "OK", for: .normal)
        actionButton.titleLabel?.font = UIFont(name: FontName.Futura, size: 20)

        actionButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
    }
    
    fileprivate func layoutUI() {
        view.addSubview(containerView)
        
        let vContentView = containerView.vibrancyView.contentView
        vContentView.addSubviews(alertImageView, titleLabel, actionButton, messageLabel)
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            containerView.widthAnchor.constraint(equalToConstant: 300),
            containerView.heightAnchor.constraint(equalToConstant: 250),
            
            alertImageView.centerXAnchor.constraint(equalTo: vContentView.centerXAnchor),
            alertImageView.topAnchor.constraint(equalTo: vContentView.topAnchor, constant: padding / 2),
            alertImageView.widthAnchor.constraint(equalToConstant: 50),
            alertImageView.heightAnchor.constraint(equalToConstant: 50),
            
            titleLabel.topAnchor.constraint(equalTo: alertImageView.bottomAnchor, constant: padding / 2),
            titleLabel.leadingAnchor.constraint(equalTo: vContentView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: vContentView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 36),

            actionButton.bottomAnchor.constraint(equalTo: vContentView.bottomAnchor),
            actionButton.leadingAnchor.constraint(equalTo: vContentView.leadingAnchor),
            actionButton.trailingAnchor.constraint(equalTo: vContentView.trailingAnchor),
            actionButton.heightAnchor.constraint(equalToConstant: 52),

            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: vContentView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: vContentView.trailingAnchor, constant: -padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -10)
        ])
    }
    
    @objc fileprivate func dismissViewController(completion: @escaping () -> Void) {
        dismiss(animated: true) {
            self.dismissDelegate?.alertDidDismissed()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
