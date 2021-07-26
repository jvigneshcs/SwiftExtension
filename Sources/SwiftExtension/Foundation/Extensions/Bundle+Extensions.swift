//
//  Bundle+Extensions.swift
//  
//
//  Created by Vignesh J on 16/09/20.
//

import Foundation

extension Bundle {
    
    /// Will try to read the JSON file and initialize the instance of specified type
    /// - Parameters:
    ///   - type: Target instance type which confirms to Decodable
    ///   - resource: File name
    ///   - fileType: File extension
    /// - Throws: Could throw pathForResourceNotFound
    /// - Returns: Target instance
    public func initInstance<T>(of type: T.Type,
                                forResource resource: String,
                                ofFileType fileType: String = "json") throws -> T? where T: Decodable {
        guard let path = self.path(forResource: resource,
                                   ofType: fileType) else {
                                    throw BundleError.pathForResourceNotFound
        }
        let url = URL(fileURLWithPath: path)
        return try Data(contentsOf: url,
                        options: .mappedIfSafe).initInstance(of: type)
    }
}

public enum BundleError: Error {
    case pathForResourceNotFound
}
