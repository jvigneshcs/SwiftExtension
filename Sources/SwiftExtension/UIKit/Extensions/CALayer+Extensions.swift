//
//  CALayer+Extensions.swift
//
//  Created by Vignesh J on 07/10/20.
//  References:
//  https://stackoverflow.com/a/17993890/618994
//  https://stackoverflow.com/a/46554726/618994

import UIKit

public extension CALayer {
    
    @objc var borderUIColor: UIColor? {
        get {
            guard let borderColor = self.borderColor else { return nil }
            return UIColor(cgColor: borderColor)
        }
        set {
            self.borderColor = newValue?.cgColor
        }
    }
}
