//
//  AppFonts.swift
//  Ruhma
//
//  Created by Manee Osman on 7/5/20.
//  Copyright © 2020 Manee Osman. All rights reserved.
//

import UIKit

enum FontWeight {
    case bold
    case extraBold
    case regular
}

class AppFonts {
    
    init () {}
    
    class var shared: AppFonts {
        struct Static {
            static let instance: AppFonts = AppFonts()
        }
        return Static.instance
    }
    
    func setFont(weight: FontWeight, size: CGFloat) -> UIFont {
        switch weight {
            case .bold:
                return UIFont(name: "HacenAlgeriaBd", size: size)!
                
            case .extraBold:
                return UIFont(name: "HacenAlgeriaHd", size: size)!
                
            default:
                return UIFont(name: "HacenAlgeria", size: size)!
        }
    }
}
