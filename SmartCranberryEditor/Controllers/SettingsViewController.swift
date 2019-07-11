//
//  SettingsViewController.swift
//  SmartCranberryEditor
//
//  Created by Mosquito1123 on 11/07/2019.
//  Copyright © 2019 Cranberry. All rights reserved.
//

import UIKit

class SettingsViewController: FXFormViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = NSLocalizedString("Settings", comment: "")
        self.formController.form = SettingsForm.sharedForm
        
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneItemDidTap))
        self.navigationItem.rightBarButtonItem = doneItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
    @objc func fontDidTap(_ sender: AnyObject) {
        let fontController = EDHFontSelector.shared().settingsViewController()
        self.navigationController?.pushViewController(fontController!, animated: true)
    }
    
    @objc func acknowledgementsDidTap(_ sender: AnyObject) {
        let acknowledgementsController = VTAcknowledgementsViewController(
            path: Bundle.main.path(forResource: "Pods-acknowledgements", ofType: "plist")
        )
        //let acknowledgementsController = VTAcknowledgementsViewController() // Doesn't work
        self.navigationController?.pushViewController(acknowledgementsController!, animated: true)
    }
    
    @objc func doneItemDidTap(_ sender: AnyObject) {
        self.close()
    }
    
    // MARK: - Utilities
    
    func close() {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
