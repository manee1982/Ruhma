//
//  AppFonts.swift
//  Ruhma
//
//  Created by Manee Osman on 7/5/20.
//  Copyright © 2020 Manee Osman. All rights reserved.
//

import UIKit

class AppViews {
    
    init () {}
    
    class var shared: AppViews {
        struct Static {
            static let instance: AppViews = AppViews()
        }
        return Static.instance
    }
    
    
    func createLabel(text: String, color: UIColor?, fontType: FontWeight, fontSize: CGFloat) -> UILabel {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = text
        if let color = color {
            lb.textColor = color
        }
        lb.font = AppFonts.shared.setFont(weight: fontType, size: fontSize)
        
        return lb
    }
    
    func createUIView(color: UIColor, corderRadius: CGFloat) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
        view.layer.cornerRadius = corderRadius
        
        return view
    }
    
    func createStackView() -> UIStackView {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        return sv
    }
    
    func createButton(title: String, backgroundColor: ColorsEnum) -> UIButton {
        let btn = UIButton()
        btn.setTitle(title.localized().localized(), for: .normal)
        btn.layer.cornerRadius = 10
        btn.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        
        switch backgroundColor {
        case .primary:
            btn.backgroundColor = AppColors.color(color: .primary)
            
        case .secondary:
            btn.backgroundColor = AppColors.color(color: .secondary)
            
        case .defaultColor:
            btn.backgroundColor = AppColors.color(color: .defaultColor)
            
        case .grey:
            btn.backgroundColor = AppColors.color(color: .primary)
            
        default:
            btn.backgroundColor = UIColor.clear
            btn.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            btn.layer.borderWidth = 1
            btn.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        }
        
        btn.titleLabel?.font = AppFonts.shared.setFont(weight: .regular, size: 17)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }
    
    func createTextField(placeHolder: String, borderColor: ColorsEnum) -> UITextField {
        let tf = UITextField()
        tf.placeholder = placeHolder
        tf.layer.borderWidth = 2
        tf.layer.cornerRadius = 10
        
        switch borderColor {
        case .primary:
            tf.layer.borderColor = AppColors.color(color: .primary).cgColor
            
        case .secondary:
            tf.layer.borderColor = AppColors.color(color: .primary).cgColor
            
        case .defaultColor:
            tf.layer.borderColor = AppColors.color(color: .defaultColor).cgColor
            
        case .grey:
            tf.layer.borderColor = AppColors.color(color: .grey).cgColor
            
        default:
            tf.layer.borderColor = UIColor.clear.cgColor
            tf.layer.borderWidth = 0
        }
        
        tf.font = AppFonts.shared.setFont(weight: .regular, size: 17)
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        return tf
    }
}
