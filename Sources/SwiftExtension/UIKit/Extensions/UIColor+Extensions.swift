//
//  UIColor+Extensions.swift
//
//  Created by Vignesh J on 12/08/20.
//

import UIKit

public extension UIColor {
    
    private static func validRGBAComponent(for value: CGFloat) -> CGFloat {
        max(0.0, min(1.0, value))
    }
    
    convenience init(red: UInt8,
                     green: UInt8,
                     blue: UInt8,
                     alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: UIColor.validRGBAComponent(for: alpha))
    }
    
    convenience init(gray: CGFloat,
                     alpha: CGFloat = 1.0) {
        let validGray = UIColor.validRGBAComponent(for: gray)
        
        self.init(red: validGray,
                  green: validGray,
                  blue: validGray,
                  alpha: UIColor.validRGBAComponent(for: alpha))
    }
    
    convenience init(gray: UInt8,
                     alpha: CGFloat = 1.0) {
        self.init(red: gray,
                  green: gray,
                  blue: gray,
                  alpha: UIColor.validRGBAComponent(for: alpha))
    }
    
    convenience init(hex: Int,
                     alpha: CGFloat = 1.0) {
        self.init(red: UInt8((hex >> 16) & 0xFF),
                  green: UInt8((hex >> 8) & 0xFF),
                  blue: UInt8(hex & 0xFF),
                  alpha: UIColor.validRGBAComponent(for: alpha))
    }
}
