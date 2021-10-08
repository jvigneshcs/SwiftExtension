//
//  UIDevice+Extensions.swift
//  
//
//  Created by Vignesh J on 08/10/21.
//

import UIKit

extension UIDevice {
    
    public var isPad: Bool {
        self.userInterfaceIdiom == .pad
    }
    
    public var isPhone: Bool {
        self.userInterfaceIdiom == .phone
    }
    
    public var isTV: Bool {
        self.userInterfaceIdiom == .tv
    }
    
    public func set(interfaceOrientation orientation: UIInterfaceOrientation) {
        self.setValue(orientation.rawValue,
                      forKey: "orientation")
    }
}
