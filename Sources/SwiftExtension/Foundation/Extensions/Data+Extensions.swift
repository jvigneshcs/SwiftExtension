//
//  Data+Extensions.swift
//  
//
//  Created by Vignesh J on 07/09/20.
//

import Foundation

public extension Data {
    
    /// Will return the Array of self
    var array: [UInt8] {
        Array(self)
    }
    
    /// Will try to initialize the instance of specified type
    /// - Parameter type: Target instance type which confirms to Decodable
    /// - Throws: Could throw decode error
    /// - Returns: Target instance
    func initInstance<T>(of type: T.Type) throws -> T? where T : Decodable {
        try JSONDecoder().decode(type,
                                 from: self)
    }
}
