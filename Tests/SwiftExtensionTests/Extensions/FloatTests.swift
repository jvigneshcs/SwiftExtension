//
//  FloatTests.swift
//  
//
//  Created by Vignesh J on 12/11/20.
//

import XCTest
@testable import SwiftExtension

final class FloatTests: XCTestCase {
    
    func testIsNotZero() {
        var value: Float = 0
        
        XCTAssertFalse(value.isNotZero, "Value is not 0")
        
        value = -0.001
        
        XCTAssertTrue(value.isNotZero, "Value is 0")
        
        value = 0.001
        
        XCTAssertTrue(value.isNotZero, "Value is 0")
        
        value = 3.14
        
        XCTAssertTrue(value.isNotZero, "Value is 0")
    }
    
    func testIsValidNumber() {
        var value: Float = 0
        
        XCTAssertTrue(value.isValidNumber, "Value is Invalid")
        
        value = .nan
        
        XCTAssertFalse(value.isValidNumber, "Value is Valid")
        
        value = .infinity
        
        XCTAssertFalse(value.isValidNumber, "Value is Valid")
        
        value = -.infinity
        
        XCTAssertFalse(value.isValidNumber, "Value is Valid")
        
        value = 3.14
        
        XCTAssertTrue(value.isValidNumber, "Value is Invalid")
    }
    
    func testIsValidAndNotZero() {
        var value: Float = 0
        
        XCTAssertFalse(value.isValidAndNotZero, "Value is valid")
        
        value = .pi
        
        XCTAssertTrue(value.isValidAndNotZero, "Value is invalid")
    }
    
    func testRoundToPlaces() {
        XCTAssertEqual(Float.pi.round(to: 4), 3.1416, "Value is not equal")
        XCTAssertEqual(Float.pi.round(to: 2), 3.14, "Value is not equal")
    }
    
    func testFormatterRoundToPlaces() {
        var value: Float = 3.1401
        
        XCTAssertEqual(value.formatted(roundTo: 3), "3.14", "Value is not equal")
        
        value = 3.148
        
        XCTAssertEqual(value.formatted(), "3.15", "Value is not equal")
        
        value = 3
        
        XCTAssertEqual(value.formatted(), "3", "Value is not equal")
        
        value = 0
        
        XCTAssertEqual(value.formatted(), "0", "Value is not equal")
        
        value = -0.1
        
        XCTAssertEqual(value.formatted(), "-0.1", "Value is not equal")
    }
}
