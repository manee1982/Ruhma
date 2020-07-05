//
//  AppColors.swift
//  Ruhma
//
//  Created by Manee Osman on 7/5/20.
//  Copyright © 2020 Manee Osman. All rights reserved.
//

import UIKit

enum ColorsEnum {
    case primary
    case secondary
    case defaultColor
    case grey
    case clear
}

class AppColors {
    
    init() {}
    
    static func color(color: ColorsEnum) -> UIColor {
        switch color {
        case .primary:
            return #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                
        case .secondary:
            return #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            
        case .grey:
            return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            
        case .defaultColor:
            return #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                
        default:
            return UIColor.clear
        }
    }
}
