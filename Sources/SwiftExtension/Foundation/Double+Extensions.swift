//
//  Double+Extensions.swift
//  
//
//  Created by Vignesh J on 17/02/21.
//

import Foundation

extension Double: DecimalRoundable {
    
    /// Value is rounded to specified number of places
    /// - Parameter places: Number of places
    /// - Returns: Rounded value
    public func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    /// Formats the rounded value to specified number of places
    /// - Parameter places: Number of places
    /// - Returns: Formatter String
    public func formatted(roundTo places: Int = 2) -> String {
        let value = self.round(to: places)
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = (value > 0 && value < 1.0) ? 1 : 0
        formatter.maximumFractionDigits = places
        
        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
}
