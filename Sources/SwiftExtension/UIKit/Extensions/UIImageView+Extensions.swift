//
//  UIImageView+Extensions.swift
//
//  Created by Vignesh J on 09/10/20.
//

import UIKit

public extension UIImageView {
    
    func set(imageColor color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}
