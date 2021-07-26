//
//  StringTests.swift
//  
//
//  Created by Vignesh J on 28/09/20.
//

import XCTest
@testable import FoundationExtension

final class StringTests: XCTestCase {
    
    func testInitInstance() {
        let jsonString = "[\"First\", \"Second\", \"Third\"]"
        let array = try? jsonString.initInstance(of: [String].self,
                                            encoding: .utf8)
        XCTAssertNotNil(array, "Array is nil")
        XCTAssert(array?.isEmpty == false, "Array is empty")
    }

    static var allTests = [
        ("testInitInstance", testInitInstance),
    ]
}
