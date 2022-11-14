// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "calc",
    // name, platforms, products, etc.
    dependencies: [
        // other dependencies
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
    ],
    targets: [
        .executableTarget(name: "calc", dependencies: [
            // other dependencies
            .product(name: "ArgumentParser", package: "swift-argument-parser"),
        ]),
        // other targets
    ]
)


