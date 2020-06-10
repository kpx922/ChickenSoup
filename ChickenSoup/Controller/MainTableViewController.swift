//
//  MainTableViewController.swift
//  ChickenSoup
//
//  Created by Shihchiao Chao on 3/31/20.
//  Copyright © 2020 Shihchiao Chao. All rights reserved.
//

import UIKit
import GoogleMobileAds

class MainTableViewController: UIViewController {
    
    lazy var selectedOption = (Quotations.type.positivity, Int())

    let tableView = CSTableView()
    var randomNums = [Int]()
    
    var adView = AdView()
    var interstitial: GADInterstitial!

    var negativityCounts = 0 {
        didSet {
            if negativityCounts == 5 {
                presentAd()
                
            } else {
                if negativityCounts == 3 {
                    presentAlert()
                    return
                }
                presentSecondViewController(with: selectedOption)
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        randomNums = generateRandomNums()
        interstitial = createAndLoadInterstitial()
        configureNavigation()
        configureView()
        layoutViews()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        tableView.reloadData()
        navigationController?.navigationBar.tintColor = traitCollection.userInterfaceStyle == .dark ? Color.white : Color.black
    }
    
    @objc fileprivate func handleAction() {
        let dropDownMenuVC = DropDownMenuViewController()
        dropDownMenuVC.dropDownMenuViewControllerDelegate = self
        dropDownMenuVC.modalPresentationStyle = .overFullScreen
        dropDownMenuVC.modalTransitionStyle = .crossDissolve
        
        present(dropDownMenuVC, animated: true)
    }
    
    fileprivate func generateRandomNums() -> [Int] {
        var nums = [Int]()
        for _ in 0..<3 {
            var num: Int
            repeat {
                num = Int.random(in: 1...20)
            } while nums.contains(num)
            nums.append(num)
        }
        return nums
    }
    
    fileprivate func configureNavigation() {
        let attributes = [NSAttributedString.Key.font: UIFont(name: FontName.Futura, size: 24)!, NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        
        let navBar = navigationController?.navigationBar
        navBar?.isHidden            = false
        navBar?.topItem?.title      = Title.appTitle
        navBar?.titleTextAttributes = attributes
        
        navBar?.shadowImage         = UIImage()
        navBar?.tintColor           = traitCollection.userInterfaceStyle == .dark ? Color.white : Color.black
        navBar?.setBackgroundImage(UIImage(), for: .default)
        navBar?.setTitleVerticalPositionAdjustment(CGFloat(8), for: UIBarMetrics.default)

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: SFSymbols.more, style: .plain, target: self, action: #selector(handleAction))
    }

    fileprivate func configureView() {
        view.backgroundColor        = Color.backgroundColor
        
        tableView.delegate          = self
        tableView.dataSource        = self
        
        adView.setupAd(rootViewController: self)
    }
    
    fileprivate func layoutViews() {
        view.addSubviews(tableView, adView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            adView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            adView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            adView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            adView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    fileprivate func presentSecondViewController(with option: (quotationsType: Quotations.type, backgroundNumber: Int)) {
        let quoteViewController = QuoteViewController()

        quoteViewController.quotationsType = option.quotationsType
        quoteViewController.backgroundNumber = option.backgroundNumber
        present(quoteViewController, animated: true)
    }

    fileprivate func createAndLoadInterstitial() -> GADInterstitial {
        let interstitial = GADInterstitial(adUnitID: AdUnitId.interstitial.id)
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
    }
    
    fileprivate func presentAd() {
        if !interstitial.isReady {
            print("Ad wasn't ready")
            return
        }
        
        interstitial.present(fromRootViewController: self)
    }
    
    fileprivate func presentAlert() {
        let title = "Warning"
        let message = "Viewing too many negativity may result depression :P"
        presentCSAlertOnMainThread(type: .warning, title: title, message: message, buttonTitle: "OK", fromView: self)
    }
}

extension MainTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CSCell.cellId, for: indexPath) as! CSCell
        cell.setup(indexPath, backgroundNum: randomNums[indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath) as? CSCell
        guard let backgroundNumber = selectedCell?.backgroundNumber else { return }
        
        let selectedRow = indexPath.item
        let quotationsType = selectedRow == 0 ? Quotations.type.soupOfTheDay : selectedRow == 1 ? Quotations.type.positivity : Quotations.type.negativity
        
        selectedOption = (quotationsType, backgroundNumber)
        
        if quotationsType == Quotations.type.negativity {
            negativityCounts += 1
            
        } else {
            presentSecondViewController(with: selectedOption)
        }
    }
}

// alert
extension MainTableViewController: CSAlertViewControllerDismissDelegate {
    func alertDidDismissed() {
        presentSecondViewController(with: selectedOption)
    }
}

// Ad
extension MainTableViewController: DropDownMenuViewControllerDelegate, GADInterstitialDelegate {
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstitial = createAndLoadInterstitial()
        negativityCounts = 0
    }
    
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        print("did received ad")
    }
    
    func interstitialDidFail(toPresentScreen ad: GADInterstitial) {
        print("did fail to present")
    }
    
    func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
        print("error")
        
    }
    
    func restorePurchases() {
        adView.restorePurchases()
    }
}
