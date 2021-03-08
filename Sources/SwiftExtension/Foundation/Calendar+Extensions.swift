//
//  Calendar+Extensions.swift
//  
//
//  Created by Vignesh J on 25/08/20.
//

import Foundation

public extension Calendar {
    
    /// Builds the Date from individual components
    /// - Parameters:
    ///   - year: Target year
    ///   - month: Target month
    ///   - day: Target day
    ///   - hour: Target hour in 24 hour format
    ///   - minute: Target minute
    ///   - second: Target second
    /// - Returns: Date
    func date(bySettingYear year: Int,
              month: Int,
              day: Int,
              hour: Int,
              minute: Int,
              second: Int) -> Date? {
        var dateComponenets = DateComponents()
        
        dateComponenets.year = year
        dateComponenets.month = month
        dateComponenets.day = day
        dateComponenets.hour = hour
        dateComponenets.minute = minute
        dateComponenets.second = second
        
        return self.date(from: dateComponenets)
    }
    
    /// Get age from date
    /// - Parameter date: Date
    /// - Returns: Age
    func age(from date: Date) -> Int? {
        self.dateComponents([.year],
                            from: date,
                            to: Date()).year
    }
}
