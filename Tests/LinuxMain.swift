import XCTest

import SwiftFoundationExtensionTests
import SwiftCoreBluetoothExtensionTests

var tests = [XCTestCaseEntry]()
tests += SwiftFoundationExtensionTests.allTests()
tests += SwiftCoreBluetoothExtensionTests.allTests()
XCTMain(tests)
