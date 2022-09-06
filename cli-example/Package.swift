// swift-tools-version:5.5
let package = Package(
    name: "cli-example",
    products: [
        .executable(name: "cli-example", targets: ["cli-example"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0")
    ],
    targets: [
        .target(name: "cli-example", dependencies: ["ArgumentParser"]),
        .testTarget(name: "cli-exampleTests", dependencies: ["cli-example"]),
    ]
)