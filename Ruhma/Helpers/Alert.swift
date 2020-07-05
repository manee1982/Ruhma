//
//  Alert.swift
//  Ruhma
//
//  Created by Manee Osman on 7/5/20.
//  Copyright © 2020 Manee Osman. All rights reserved.
//

import UIKit

import UIKit
import Localize_Swift

class Alert: UIAlertController {
    
    static func alertWithOkButton(in vc: UIViewController, title: String, message: String) {
        let uiAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        uiAlert.addAction(UIAlertAction(title: "ok".localized(), style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
        }))
        
        vc.present(uiAlert, animated: true, completion: nil)
    }
    
    static func alertWithOkAndCancelAction(in vc: UIViewController, title: String, message: String) {
        let uiAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        uiAlert.addAction(UIAlertAction(title: "ok".localized(), style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
        }))
        uiAlert.addAction(UIAlertAction(title: "cancel".localized(), style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle cancel logic here")
        }))
        
        vc.present(uiAlert, animated: true, completion: nil)
    }
}
