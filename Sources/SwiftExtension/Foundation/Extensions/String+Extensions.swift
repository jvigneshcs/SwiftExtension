//
//  String+Extensions.swift
//  
//
//  Created by Vignesh J on 16/09/20.
//

import Foundation

public extension String {
    
    /// Will try to initialize the instance of specified type
    /// - Parameters:
    ///   - type: Target instance type which confirms to Decodable
    ///   - encoding: String Encoding type
    /// - Throws: Could throw error
    /// - Returns: Target instance
    func initInstance<T>(of type: T.Type,
                         encoding: String.Encoding = .utf8) throws -> T? where T: Decodable {
        try self.data(using: encoding)?.initInstance(of: type)
    }
}
