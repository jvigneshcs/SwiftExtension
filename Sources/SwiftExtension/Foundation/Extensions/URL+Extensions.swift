//
//  URL+Extensions.swift
//  
//
//  Created by Vignesh J on 28/05/21.
//

import Foundation

extension URL {
    
    /// Joins the `pathComponents` with `/`
    public var pathComponentsString: String? {
        var components = self.pathComponents
        if components.count == 0 {
            return nil
        } else if components.first == "/" {
            components.removeFirst()
        }
        return "/" + components.joined(separator: "/")
    }
}
