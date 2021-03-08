//
//  BundleTests.swift
//  
//
//  Created by Vignesh J on 11/11/20.
//

import XCTest
@testable import SwiftFoundationExtension

final class BundleTests: XCTestCase {
    
    func testInitInstance() {
        XCTAssertThrowsError(try Bundle.main.initInstance(of: String.self,
                                                          forResource: "SomeText"), "Code not throw error")
    }
}
