import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SwiftFoundationExtensionTests.allTests),
        testCase(SwiftCoreBluetoothExtensionTests.allTests),
    ]
}
#endif
