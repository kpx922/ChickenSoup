//
//  UIViewController+Ext.swift
//  ChickenSoup
//
//  Created by Shihchiao Chao on 5/29/20.
//  Copyright © 2020 Shihchiao Chao. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentCSAlertOnMainThread(type: Alert.type, title: String, message: String, buttonTitle: String, fromView: UIViewController ) {
        DispatchQueue.main.async {
            let alertViewController = CSAlertViewController(type: type, title: title, message: message, buttonTitle: buttonTitle)
            alertViewController.modalPresentationStyle = .overFullScreen
            alertViewController.modalTransitionStyle = .crossDissolve
            alertViewController.dismissDelegate = fromView as! MainTableViewController
            self.present(alertViewController, animated: true)
        }
    }
}
