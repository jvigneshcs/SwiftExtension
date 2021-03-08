//
//  Date+Extensions.swift
//  
//
//  Created by Vignesh J on 10/11/20.
//  Reference: https://stackoverflow.com/a/40057117/618994

import Foundation

public extension Date {
    
    /// Checks if self is between two dates
    /// - Parameters:
    ///   - date1: Date 1
    ///   - date2: Date 2
    /// - Returns: True or False
    func isBetween(_ date1: Date,
                   _ date2: Date) -> Bool {
        (min(date1, date2)...max(date1, date2)).contains(self)
    }
    
    /// Checks if self is within the specified time interval
    /// - Parameter interval: Time interval
    /// - Returns: True or False
    func isBetween(interval: TimeInterval) -> Bool {
        let now = Date()
        return self.isBetween(now.addingTimeInterval(-1 * interval),
                              now.addingTimeInterval(interval))
    }
}
