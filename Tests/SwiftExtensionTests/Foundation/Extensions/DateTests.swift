//
//  DateTests.swift
//  
//
//  Created by Vignesh J on 12/11/20.
//

import XCTest
@testable import FoundationExtension

final class DateTests: XCTestCase {
    
    func testIsBetweenDates() {
        let now = Date()
        let date1 = now.addingTimeInterval(60 * 5 * -1)
        let date2 = now.addingTimeInterval(60 * 5)
        var target = now.addingTimeInterval(60 * 5 * -1)
        
        XCTAssertTrue(target.isBetween(date1,
                                       date2), "Date is not between the dates")
        
        target = target.addingTimeInterval(-1)
        
        XCTAssertFalse(target.isBetween(date1,
                                        date2), "Date is between the dates")
        
        target = now.addingTimeInterval(60 * 5)
        
        XCTAssertTrue(target.isBetween(date1,
                                       date2), "Date is not between the dates")
        
        target = target.addingTimeInterval(1)
        
        XCTAssertFalse(target.isBetween(date1,
                                        date2), "Date is between the dates")
        
        target = now
        
        XCTAssertTrue(target.isBetween(date1,
                                       date2), "Date is not between the dates")
    }
    
    func testIsBetweenInterval() {
        let now = Date()
        let interval: TimeInterval = 60 * 5
        var target = now.addingTimeInterval((interval * -1) + 1)
        
        XCTAssertTrue(target.isBetween(interval: interval), "Date is not between the interval")
        
        target = target.addingTimeInterval(-1)
        
        XCTAssertFalse(target.isBetween(interval: interval), "Date is between the interval")
        
        target = now.addingTimeInterval(interval)
        
        XCTAssertTrue(target.isBetween(interval: interval), "Date is not between the interval")
        
        target = target.addingTimeInterval(1)
        
        XCTAssertFalse(target.isBetween(interval: interval), "Date is between the interval")
        
        target = now
        
        XCTAssertTrue(target.isBetween(interval: interval), "Date is not between the interval")
    }
}
