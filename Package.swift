// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftExtension",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "FoundationExtension",
            targets: ["FoundationExtension"]),
        .library(
            name: "CoreBluetoothExtension",
            targets: ["CoreBluetoothExtension"]),
        .library(
            name: "UIKitExtension",
            targets: ["UIKitExtension"]),
        .library(
            name: "UserNotificationsExtension",
            targets: ["UserNotificationsExtension"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "FoundationExtension",
            dependencies: [],
            path: "Sources/SwiftExtension/Foundation"),
        .target(
            name: "CoreBluetoothExtension",
            dependencies: [],
            path: "Sources/SwiftExtension/CoreBluetooth"),
        .target(
            name: "UIKitExtension",
            dependencies: [],
            path: "Sources/SwiftExtension/UIKit"),
        .target(
            name: "UserNotificationsExtension",
            dependencies: [],
            path: "Sources/SwiftExtension/UserNotifications"),
        .testTarget(
            name: "FoundationExtensionTests",
            dependencies: ["FoundationExtension"],
            path: "Tests/FoundationExtensionTests"),
        .testTarget(
            name: "CoreBluetoothExtensionTests",
            dependencies: ["CoreBluetoothExtension"],
            path: "Tests/CoreBluetoothExtensionTests"),
    ]
)
