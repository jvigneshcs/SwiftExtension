//
//  FloatTests.swift
//  
//
//  Created by Vignesh J on 12/11/20.
//

import XCTest
@testable import FoundationExtension

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
    
    func testInitSFloatBitPattern() {
        var source: UInt16 = 0x07FF
        var value = Float(sFloatBitPattern: source)
        
        XCTAssertTrue(value.isNaN, "SFloat is not NAN")
        
        source = 0x0800
        value = Float(sFloatBitPattern: source)
        
        XCTAssertTrue(value.isNaN, "SFloat is not NAN")
        
        source = 0x0801
        value = Float(sFloatBitPattern: source)
        
        XCTAssertTrue(value.isNaN, "SFloat is not NAN")
        
        source = 0x07FE
        value = Float(sFloatBitPattern: source)
        
        XCTAssertTrue(value.isInfinite, "SFloat is not infinity")
        
        source = 0x0802
        value = Float(sFloatBitPattern: source)
        
        XCTAssertTrue(value.isInfinite, "SFloat is not negative infinity")
        
        source = 0xE047
        value = Float(sFloatBitPattern: source)
        
        XCTAssertEqual(value, 0.71, "SFloat is not 0.71")
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
