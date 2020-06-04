//
//  DropDownMenuViewController.swift
//  ChickenSoup
//
//  Created by Shihchiao Chao on 6/2/20.
//  Copyright © 2020 Shihchiao Chao. All rights reserved.
//

import UIKit

protocol DropDownMenuViewControllerDelegate: class {
    func restorePurchases()
}

class DropDownMenuViewController: UIViewController {

    let closeButtonView = CSMenuCloseButtonView()
    let dropDownMenuView = DropDownMenuView()
    weak var dropDownMenuViewControllerDelegate: DropDownMenuViewControllerDelegate?
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        closeButtonView.updateBackground()
        dropDownMenuView.updateBackground()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        layoutUI()
    }
    
    fileprivate func configure() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        view.addGestureRecognizer(tapGesture)
        
        closeButtonView.closeButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        dropDownMenuView.restoreButton.addTarget(self, action: #selector(restorePurchase), for: .touchUpInside)
    }

    fileprivate func layoutUI() {
        view.addSubviews(closeButtonView, dropDownMenuView)
                
        NSLayoutConstraint.activate([
            closeButtonView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2),
            closeButtonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            closeButtonView.widthAnchor.constraint(equalToConstant: 44),
            closeButtonView.heightAnchor.constraint(equalToConstant: 44),
            
            dropDownMenuView.topAnchor.constraint(equalTo: closeButtonView.bottomAnchor, constant: 16),
            dropDownMenuView.trailingAnchor.constraint(equalTo: closeButtonView.trailingAnchor),
            dropDownMenuView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc fileprivate func restorePurchase() {
        dropDownMenuViewControllerDelegate?.restorePurchases()
    }
    
    @objc fileprivate func dismissView() {
        dismiss(animated: true)
    }
}
