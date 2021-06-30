//
//  Calendar+Extensions.swift
//  
//
//  Created by Vignesh J on 25/08/20.
//  Reference: https://stackoverflow.com/a/60569015/618994

import Foundation

extension Calendar {
    
    /// Builds the Date from individual components
    /// - Parameters:
    ///   - year: Target year
    ///   - month: Target month
    ///   - day: Target day
    ///   - hour: Target hour in 24 hour format
    ///   - minute: Target minute
    ///   - second: Target second
    /// - Returns: Date
    public func date(bySettingYear year: Int,
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
    
    /// Converts other time zone date to current TimeZone date
    /// - Parameter date: Date with other timezone
    /// - Returns: Date is current timezone
    public func localDate(from date: Date) -> Date? {
        let components = self.dateComponents(in: TimeZone.current,
                                             from: date)
        
        return self.date(from: components)
    }
    
    /// Get age from date
    /// - Parameter date: Date
    /// - Returns: Age
    public func age(from date: Date) -> Int? {
        self.dateComponents([.year],
                            from: date,
                            to: Date()).year
    }
    
    /// Convert a Date to another time zone while preserving the day and time from the initial time zone
    /// - Parameters:
    ///   - timeZone: TimeZone
    ///   - date: Date
    /// - Returns: Converted date
    public func date(bySetting timeZone: TimeZone,
                     of date: Date) -> Date? {
        self.date(bySetting: self.timeZone,
                  to: timeZone,
                  of: date)
    }
    
    /// Convert a Date to the day and time from another time zone while preserving the initial time zone
    /// - Parameters:
    ///   - timeZone: TimeZone
    ///   - date: Date
    /// - Returns: Converted date
    public func date(bySettingTimeFrom timeZone: TimeZone,
                     of date: Date) -> Date? {
        self.date(bySetting: timeZone,
                  to: self.timeZone,
                  of: date)
    }
    
    /// Convert a Date from one time zone to another time zone
    /// - Parameters:
    ///   - from: From TimeZone
    ///   - to: To TimeZone
    ///   - date: Date
    /// - Returns: Converted date
    public func date(bySetting from: TimeZone,
                     to: TimeZone,
                     of date: Date) -> Date? {
        var components = self.dateComponents(in: from,
                                             from: date)
        components.timeZone = to
        
        return self.date(from: components)
    }
    
    /// Returns the last moment of a given Date, as a Date.
    ///
    /// For example, pass in `Date()`, if you want the end of today.
    /// Reference: https://stackoverflow.com/a/20158940/618994
    /// - parameter date: The date to search.
    /// - returns: The last moment of the given date.
    public func endOfDay(for date: Date) -> Date? {
        let startOfDay = self.startOfDay(for: date)
        var components = DateComponents()
        components.day = 1
        components.second = -1
        
        return self.date(byAdding: components,
                         to: startOfDay)
    }
}
