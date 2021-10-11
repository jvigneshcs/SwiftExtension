//
//  CBUUIDTests.swift
//  
//
//  Created by Vignesh J on 28/09/20.
//

import XCTest
@testable import CoreBluetooth
@testable import CoreBluetoothExtension

final class CBUUIDTests: XCTestCase {
    
    func testCBUUIDsFromString() {
        let cbuuid1 = "0x1810"
        let cbuuid2 = "0x1822"
        
        let cbuuids = CBUUID.cbuuids(from: [cbuuid1, cbuuid2])
        cbuuids.forEach { print("\(type(of: self)): CBUUID string -", $0.uuidString) }
        XCTAssert(cbuuids.contains(where: { $0.uuidString == "1810"} ), "CBUUID array does not contain CBUUID string - \(cbuuid1)")
        XCTAssert(cbuuids.contains(where: { $0.uuidString == "1822"} ), "CBUUID array does not contain CBUUID string - \(cbuuid2)")
    }

    static var allTests = [
        ("testCBUUIDsFromString", testCBUUIDsFromString),
    ]
}
