//
//  Float+Extensions.swift
//  
//
//  Created by Vignesh J on 11/11/20.
//

import Foundation

public extension Float {
    
    var isNotZero: Bool {
        !self.isZero
    }
    
    var isValidNumber: Bool {
        !self.isNaN &&
            self.isFinite
    }
    
    var isValidAndNotZero: Bool {
        self.isValidNumber &&
            self.isNotZero
    }
}

extension Float: DecimalRoundable {
    
    /// Value is rounded to specified number of places
    /// - Parameter places: Number of places
    /// - Returns: Rounded value
    public func round(to places: Int) -> Float {
        Float(Double(self).round(to: places))
    }
    
    /// Formats the rounded value to specified number of places
    /// - Parameter places: Number of places
    /// - Returns: Formatter String
    public func formatted(roundTo places: Int = 2) -> String {
        Double(self).formatted(roundTo: places)
    }
}
