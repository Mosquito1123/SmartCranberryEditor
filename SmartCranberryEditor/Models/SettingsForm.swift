//
//  SettingsForm.swift
//  SmartCranberryEditor
//
//  Created by Mosquito1123 on 11/07/2019.
//  Copyright © 2019 Cranberry. All rights reserved.
//

import UIKit

open class SettingsForm: NSObject, FXForm {
    
    fileprivate struct Defaults {
        static let accessoryViewKey = "SettingsForm.Defaults.accessoryViewKey"
    }
    
    open class var sharedForm: SettingsForm {
        struct Singleton {
            static let sharedForm = SettingsForm()
        }
        return Singleton.sharedForm
    }
    
    override init() {
        super.init()
        
        var defaults = [String: AnyObject]()
        defaults[Defaults.accessoryViewKey] = true as AnyObject?
        UserDefaults.standard.register(defaults: defaults)
        
        self.accessoryView = UserDefaults.standard.bool(forKey: Defaults.accessoryViewKey)
    }
    
    @objc var accessoryView: Bool = true {
        didSet {
            UserDefaults.standard.set(self.accessoryView, forKey: Defaults.accessoryViewKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    public func extraFields() -> [Any]! {
        return [
            [
                FXFormFieldHeader: "",
                FXFormFieldType: FXFormFieldTypeLabel,
                FXFormFieldAction: "fontDidTap:",
                FXFormFieldTitle: NSLocalizedString("Font", comment: "")
            ],
            [
                FXFormFieldHeader: "",
                FXFormFieldType: FXFormFieldTypeLabel,
                FXFormFieldAction: "acknowledgementsDidTap:",
                FXFormFieldTitle: NSLocalizedString("Acknowledgements", comment: "")
            ]
        ]
    }
}
