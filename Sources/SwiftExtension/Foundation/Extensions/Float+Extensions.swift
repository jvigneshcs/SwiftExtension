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
    
    /// Float from SFloat bitPattern UInt16
    /// - Parameter value: UInt16 value
    init(sFloatBitPattern value: UInt16) {
        // Check special values defined by SFLOAT first
        // 0x800 - This is really NRes, "Not at this Resolution"
        // 0x801 - This is really RESERVED FOR FUTURE USE
        switch value {
        case 0x07FF, 0x800, 0x801:
            self = Float.nan
        case 0x7FE:
            self = Float.infinity
        case 0x0802:
            self = -Float.infinity // This is really negative infinity
        default:
            // Get exponent (high 4 bits)
            let expo = (value & 0xF000) >> 12
            let expoFloat = Float(expo,
                                  havingBitsInValueIncludingSign: 4)
            
            // Get mantissa (low 12 bits)
            let mantissa = value & 0x0FFF
            let mantissaFloat = Float(mantissa,
                                      havingBitsInValueIncludingSign: 12)
            
            // Put it together
            self = mantissaFloat * pow(10.0, expoFloat)
        }
    }
    
    private init(_ value: UInt16,
                 havingBitsInValueIncludingSign bitsInValueIncludingSign: Int) {
        // calculate a signed float from a two's complement signed value
        // represented in the lowest n ("bitsInValueIncludingSign") bits
        // of the UInt16 value
        let signMask: UInt16 = UInt16(0x1) << (bitsInValueIncludingSign - 1)
        let signMultiplier: Float = (value & signMask == 0) ? 1.0 : -1.0

        var valuePart = value
        if signMultiplier < 0 {
            // Undo two's complement if it's negative
            var valueMask = UInt16(1)
            for _ in 0 ..< bitsInValueIncludingSign - 2 {
                valueMask = valueMask << 1
                valueMask += 1
            }
            valuePart = ((~value) & valueMask) &+ 1
        }

        self = Float(valuePart) * signMultiplier
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
