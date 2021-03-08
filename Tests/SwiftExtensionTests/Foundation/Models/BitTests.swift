//
//  BitTests.swift
//  
//
//  Created by Vignesh J on 28/09/20.
//

import XCTest
@testable import SwiftFoundationExtension

final class BitTests: XCTestCase {
    
    func testInit() {
        var value = Bit(rawValue: 0)
        
        XCTAssertEqual(value, .zero, "Bit value is not zero")
        
        value = Bit(rawValue: 1)
        
        XCTAssertEqual(value, .one, "Bit value is not one")
        
        value = Bit(rawValue: 2)
        
        XCTAssertNil(value, "Bit value is not nil")
        
    }
    
    func testRawValue() {
        var value = Bit.zero
        
        XCTAssertEqual(value.rawValue, 0, "Raw value is not equal to 0")
        
        value = .one
        
        XCTAssertEqual(value.rawValue, 1, "Raw value is not equal to 1")
    }
    
    func testDescription() {
        var value = Bit.zero
        
        XCTAssertEqual(value.description, "0", "Description is not equal")
        
        value = .one
        
        XCTAssertEqual(value.description, "1", "Description is not equal")
    }
    
    func testIsOne() {
        var value = Bit.zero
        
        XCTAssertFalse(value.isOne, "Value is 1")
        
        value = .one
        
        XCTAssertTrue(value.isOne, "Value is 0")
    }
    
    func testIsZero() {
        var value = Bit.zero
        
        XCTAssertTrue(value.isZero, "Value is 1")
        
        value = .one
        
        XCTAssertFalse(value.isZero, "Value is 0")
    }

    static var allTests = [
        ("testInit", testInit),
        ("testRawValue", testRawValue),
        ("testDescription", testDescription),
    ]
}
