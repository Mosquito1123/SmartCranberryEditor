//
//  FinderListViewController.swift
//  SmartCranberryEditor
//
//  Created by Mosquito1123 on 11/07/2019.
//  Copyright © 2019 Cranberry. All rights reserved.
//

import UIKit

class FinderListViewController: EDHFinderListViewController {
    
    let kToolbarIconSize: CGFloat = 26.0
    
//    var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.initAd()
        
        let settingsItem = Utility.barButtonItem(target: self,
                                                 icon: FAKIonIcons.gearAIcon(withSize: self.kToolbarIconSize),
                                                 action: #selector(settingsItemDidTap))
        navigationItem.leftBarButtonItem = settingsItem
        navigationItem.leftItemsSupplementBackButton = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Utilities
    /*
    func initAd() {
        if UIDevice.current.orientation.isLandscape {
            self.bannerView = GADBannerView(adSize: kGADAdSizeSmartBannerLandscape)
        } else {
            self.bannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        }
        
        //        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
        //            self.bannerView = GADBannerView(adSize: kGADAdSizeMediumRectangle)
        //        } else {
        //            self.bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        //        }
        
        self.bannerView.adUnitID =  AppSecret.AdMob.unitId
        self.bannerView.rootViewController = self
        
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        self.bannerView.load(request)
        
        self.tableView.tableFooterView = self.bannerView
    }
 */
    
    // MARK: - Actions
    
    @objc func settingsItemDidTap(_ sender: AnyObject) {
        let formController = SettingsViewController()
        let navController = UINavigationController(rootViewController: formController)
        navController.modalPresentationStyle = .formSheet
        self.present(navController, animated: true, completion: nil)
    }
}
