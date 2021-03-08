//
//  CalendarTests.swift
//  
//
//  Created by Vignesh J on 28/09/20.
//

import XCTest
@testable import SwiftExtension

final class CalendarTests: XCTestCase {
    
    func testDateBySettingAllComponent() {
        let calendar = Calendar.current
        guard let date = calendar.date(bySettingYear: 2020,
                                         month: 9,
                                         day: 20,
                                         hour: 18,
                                         minute: 35,
                                         second: 45) else {
                                            XCTAssert(false, "Date is nil")
                                            return
        }
        
        
        XCTAssertEqual(calendar.component(.year, from: date), 2020, "Year is not equal")
        XCTAssertEqual(calendar.component(.month, from: date), 9, "Month is not equal")
        XCTAssertEqual(calendar.component(.day, from: date), 20, "Day is not equal")
        XCTAssertEqual(calendar.component(.hour, from: date), 18, "Hout is not equal")
        XCTAssertEqual(calendar.component(.minute, from: date), 35, "Minute is not equal")
        XCTAssertEqual(calendar.component(.second, from: date), 45, "Second is not equal")
    }
    
    func testAgeFromDate() {
        let calendar = Calendar.current
        let interval: TimeInterval = 60 * 60 * 24 * 365 * 6
        let now = Date()
        var date = now.addingTimeInterval(-interval)
        
        XCTAssertEqual(calendar.age(from: date), 5, "Age is not equal")
        
        date = now.addingTimeInterval(interval)
        
        XCTAssertEqual(calendar.age(from: date), -5, "Age is not equal")
    }

    static var allTests = [
        ("testDateBySettingAllComponent", testDateBySettingAllComponent),
    ]
}
