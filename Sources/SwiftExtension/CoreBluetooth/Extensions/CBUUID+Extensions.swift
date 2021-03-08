//
//  CBUUID+Extensions.swift
//  
//
//  Created by Vignesh J on 21/08/20.
//

import CoreBluetooth

public extension CBUUID {
    
    /// Converts array of String to array of CBUUID
    /// - Parameter strings: source array of String
    /// - Returns: Target array of CBUUID
    static func cbuuids(from strings: [String]) -> [CBUUID] {
        strings.compactMap { CBUUID(string: $0) }
    }
}
