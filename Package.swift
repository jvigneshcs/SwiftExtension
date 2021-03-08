// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftExtension",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SwiftFoundationExtension",
            targets: ["SwiftFoundationExtension"]),
        .library(
            name: "SwiftCoreBluetoothExtension",
            targets: ["SwiftCoreBluetoothExtension"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SwiftFoundationExtension",
            dependencies: [],
            path: "Sources/SwiftExtension/Foundation"),
        .target(
            name: "SwiftCoreBluetoothExtension",
            dependencies: [],
            path: "Sources/SwiftExtension/CoreBluetooth"),
        .testTarget(
            name: "SwiftFoundationExtensionTests",
            dependencies: ["SwiftFoundationExtension"],
            path: "Tests/SwiftExtensionTests/Foundation"),
        .testTarget(
            name: "SwiftCoreBluetoothExtensionTests",
            dependencies: ["SwiftCoreBluetoothExtension"],
            path: "Tests/SwiftExtensionTests/CoreBluetooth"),
    ]
)
