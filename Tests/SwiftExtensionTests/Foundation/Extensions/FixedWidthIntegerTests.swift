//
//  FixedWidthIntegerTests.swift
//  
//
//  Created by Vignesh J on 28/09/20.
//

import XCTest
@testable import SwiftExtension

final class FixedWidthIntegerTests: XCTestCase {
    
    func testByteArray() {
        let value: UInt16 = 280
        let array = value.byteArray
        XCTAssertEqual(array.first, 24, "First byte is not 24")
        XCTAssertEqual(array.last, 1, "Last byte is not 1")
    }
    
    func testLittleEndianBits() {
        let value: UInt8 = 10
        let bits = value.littleEndianBits
        self.compareBit(at: 0,
                        in: bits,
                        with: 0)
        self.compareBit(at: 1,
                        in: bits,
                        with: 1)
        self.compareBit(at: 2,
                        in: bits,
                        with: 0)
        self.compareBit(at: 3,
                        in: bits,
                        with: 1)
        self.compareBit(at: 4,
                        in: bits,
                        with: 0)
        self.compareBit(at: 5,
                        in: bits,
                        with: 0)
        self.compareBit(at: 6,
                        in: bits,
                        with: 0)
        self.compareBit(at: 7,
                        in: bits,
                        with: 0)
    }
    
    func testBigEndianBits() {
        let value: UInt8 = 10
        let bits = value.bigEndianBits
        self.compareBit(at: 0,
                        in: bits,
                        with: 0)
        self.compareBit(at: 1,
                        in: bits,
                        with: 0)
        self.compareBit(at: 2,
                        in: bits,
                        with: 0)
        self.compareBit(at: 3,
                        in: bits,
                        with: 0)
        self.compareBit(at: 4,
                        in: bits,
                        with: 1)
        self.compareBit(at: 5,
                        in: bits,
                        with: 0)
        self.compareBit(at: 6,
                        in: bits,
                        with: 1)
        self.compareBit(at: 7,
                        in: bits,
                        with: 0)
    }
    
    func testData() {
        let value: UInt16 = 280
        let array = value.data.array
        XCTAssertEqual(array.first, 24, "First byte is not 24")
        XCTAssertEqual(array.last, 1, "Last byte is not 1")
    }
    
    private func compareBit(at index: Int,
                            in bits: [Bit],
                            with value: UInt8) {
        XCTAssertEqual(bits[index].rawValue, value, "Bit at \(index) is not \(value)")
    }

    static var allTests = [
        ("testByteArray", testByteArray),
        ("testLittleEndianBits", testLittleEndianBits),
        ("testBigEndianBits", testBigEndianBits),
        ("testData", testData),
    ]
}
