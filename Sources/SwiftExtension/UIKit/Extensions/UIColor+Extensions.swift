//
//  UIColor+Extensions.swift
//
//  Created by Vignesh J on 12/08/20.
//

import UIKit

public extension UIColor {
    
    convenience init(red: Int,
                     green: Int,
                     blue: Int,
                     alpha: CGFloat = 1.0) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        assert(alpha >= 0.0 && alpha <= 1.0, "Invalid alpha component")
        
        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: alpha)
    }
    
    convenience init(gray: CGFloat,
                     alpha: CGFloat = 1.0) {
        assert(gray >= 0.0 && gray <= 1.0, "Invalid gray component")
        assert(alpha >= 0.0 && alpha <= 1.0, "Invalid alpha component")
        
        self.init(red: gray,
                  green: gray,
                  blue: gray,
                  alpha: alpha)
    }
    
    convenience init(gray: Int,
                     alpha: CGFloat = 1.0) {
        self.init(red: gray,
                  green: gray,
                  blue: gray,
                  alpha: alpha)
    }
    
    convenience init(hex: Int,
                     alpha: CGFloat = 1.0) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF,
            alpha: alpha)
    }
}
