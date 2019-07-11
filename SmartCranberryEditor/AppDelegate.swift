//
//  AppDelegate.swift
//  SmartCranberryEditor
//
//  Created by Mosquito1123 on 11/07/2019.
//  Copyright © 2019 Cranberry. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate, EDHFinderDelegate {
    
    var window: UIWindow?
    
    var splitController: UISplitViewController!
    var editorController: EditorViewController!
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
 
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        EDHFontSelector.shared().defaultFontName = "Courier"
        
        self.setAppearance()
        self.initExample()
        
        self.editorController = EditorViewController()
        let editorNavController = UINavigationController(rootViewController: self.editorController)
        if #available(iOS 11.0, *) {
            editorNavController.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
        
        EDHFinder.shared().toolbarHidden = false
        EDHFinder.shared().finderDelegate = self
        guard let masterNavController = EDHFinder.shared().listNavigationController(with: editorController) else {return true}
        if UIDevice.current.userInterfaceIdiom == .pad {
            if let listController = masterNavController.topViewController as? UITableViewController {
                listController.clearsSelectionOnViewWillAppear = false
                listController.preferredContentSize = CGSize(width: 320.0, height: 600.0)
            }
        }
        
        self.splitController = UISplitViewController()
        self.splitController.viewControllers = [masterNavController, editorNavController]
        self.splitController.delegate = self
        
        editorController.navigationItem.leftBarButtonItem = self.splitController.displayModeButtonItem
        editorController.navigationItem.leftItemsSupplementBackButton = true
        
        self.window?.rootViewController = self.splitController
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
    }
    
    // MARK: - UISplitViewControllerDelegate
    
    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController) -> Bool {
        if let secondaryAsNavController = secondaryViewController as? UINavigationController {
            if let topAsDetailController = secondaryAsNavController.topViewController as? EditorViewController {
                if topAsDetailController.finderItem == nil {
                    // Return true to indicate that we have handled the collapse by doing nothing;
                    // the secondary controller will be discarded.
                    return true
                }
            }
        }
        return false
    }
    
    // MARK: - EDHFinderDelegate
    
    func listViewController(withPath path: String!,
                            delegate: EDHFinderListViewControllerDelegate!) -> EDHFinderListViewController! {
        return FinderListViewController(path: path, delegate: delegate)
    }
    
    // MARK: - Utilities
    
    func setAppearance() {
        // 118, 122, 133
        // #767a85
        UINavigationBar.appearance().barTintColor = UIColor.chiliPowder()
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UINavigationBar.appearance().tintColor ?? UIColor.blue
        ]
        
        UIToolbar.appearance().barTintColor = UINavigationBar.appearance().barTintColor
        UIToolbar.appearance().tintColor = UINavigationBar.appearance().tintColor
    }
    
    func initExample() {
        //EDHUtility.setIsFirstLaunch(true)
        if EDHUtility.isFirstLaunch() {
            let fromPath = Bundle.main.path(forResource: "bootstrap", ofType: nil)
            let toPath = (EDHFinder.shared().rootPath as NSString).appendingPathComponent("example")
            FCFileManager.copyItem(atPath: fromPath, toPath: toPath)
            EDHUtility.setIsFirstLaunch(false)
        }
    }
    
}


