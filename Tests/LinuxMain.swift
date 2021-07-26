import XCTest

import FoundationExtensionTests
import CoreBluetoothExtensionTests

var tests = [XCTestCaseEntry]()
tests += FoundationExtensionTests.allTests()
tests += CoreBluetoothExtensionTests.allTests()
XCTMain(tests)
