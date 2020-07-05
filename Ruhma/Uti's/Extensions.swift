//
//  Extensions.swift
//  Ruhma
//
//  Created by Manee Osman on 7/5/20.
//  Copyright © 2020 Manee Osman. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import Localize_Swift

extension UIViewController {
    
    func customNavigationController() {
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationItem.hidesBackButton = true
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: AppFonts.shared.setFont(type: .regular, size: 17),
            NSAttributedString.Key.foregroundColor: UIColor.init(red: 1, green: 0.5003957152, blue: 0, alpha: 1)
        ]
    }
    
    @objc func dissmissKeyboard () {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y == 0 {
//                self.view.frame.origin.y -= keyboardSize.height
//            }
//        }
        
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= 100
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0 // Move view to original position
    }
    
    func switchNumbersBetweenArabicAndEnglish(text : String, changeToArabic number: Bool)-> String {
        let numbersDictionary : Dictionary = ["0" : "٠","1" : "١", "2" : "٢", "3" : "٣", "4" : "٤", "5" : "٥", "6" : "٦", "7" : "٧", "8" : "٨", "9" : "٩"]
        var str = text
        
        for (key,value) in numbersDictionary {
            str = (number) ? str.replacingOccurrences(of: key, with: value) : str.replacingOccurrences(of: value, with: key)
        }
        print("Changing number \(str)")
        return str
    }
}

extension UIImageView {
    
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
    
    func cacheImage(imageURL url: String, imageView: UIImageView, image indicator: NVActivityIndicatorView) {
        let imageCache = NSCache<AnyObject, AnyObject>()
        let url = URL(string: url)
        
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
            imageView.image = imageFromCache
            
            indicator.stopAnimating()
            indicator.removeFromSuperview()
        }
        
        URLSession.shared.dataTask(with: url!) {
            data, response, error in
            if data != nil {
                DispatchQueue.main.async {
                    let imageToCache = UIImage(data: data!)
                    imageCache.setObject(imageToCache!, forKey: url as AnyObject)
                    imageView.image = imageToCache
                    
                    indicator.stopAnimating()
                    indicator.removeFromSuperview()
                }
            }
        }.resume()
    }
}

extension UITextField {
    
    enum PaddingSide {
        case left(CGFloat)
        case right(CGFloat)
        case both(CGFloat)
    }
    
    func addPadding(_ padding: PaddingSide) {
        
        self.leftViewMode = .always
        self.layer.masksToBounds = true
        
        
        switch padding {
            
        case .left(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.leftView = paddingView
            self.rightViewMode = .always
            
        case .right(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.rightView = paddingView
            self.rightViewMode = .always
            
        case .both(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            // left
            self.leftView = paddingView
            self.leftViewMode = .always
            // right
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
}

extension UIView {
    func pinEdgesToSuperView() {
        guard let superView = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leftAnchor.constraint(equalTo: superView.leftAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        rightAnchor.constraint(equalTo: superView.rightAnchor).isActive = true
    }
}

extension String {
    func substring(from: Int, to: Int) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: from)
        let endIndex = self.index(self.startIndex, offsetBy: to)
        return String(self[startIndex...endIndex])
    }
    
    public var toEnglishDigits: String {
        var str = self
        let map = ["٠": "0",
                   "١": "1",
                   "٢": "2",
                   "٣": "3",
                   "٤": "4",
                   "٥": "5",
                   "٦": "6",
                   "٧": "7",
                   "٨": "8",
                   "٩": "9"]
        map.forEach { str = str.replacingOccurrences(of: $0, with: $1) }
        return str
    }
    
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}

extension UICollectionViewCell {
    func getSwitchButtonValue(switchButton: UISwitch) -> String {
        if switchButton.isOn {
            return "true"
        } else {
            return "false"
        }
    }
}
