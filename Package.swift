// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "libDummy",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "libDummy",
            targets: ["libDummy"]),
    ],
    dependencies: [
        .package(url: "https://github.com/stefanspringer1/SwiftXML", from: "1.2.310"),
        .package(url: "https://github.com/stefanspringer1/SwiftUtilities", from: "0.0.198"),
        .package(url: "https://github.com/stefanspringer1/SwiftWorkflow", from: "1.2.178"),
        .package(url: "https://github.com/stefanspringer1/WorkflowUtilitiesForSwiftXML", from: "0.0.43"),
        .package(url: "https://github.com/apple/swift-argument-parser", Version(1,0,1)...Version(1,0,1)),
        .package(url: "https://github.com/stefanspringer1/ZIPFoundationModern", revision: "3149b5ee91e88ce810bc2958d04ce3ace5af4c4c"), // need this because of unsafe C-flag for Windows
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "libDummy",
            dependencies: [
                "SwiftXML",
                .product(name: "Utilities", package: "SwiftUtilities"),
                .product(name: "Workflow", package: "SwiftWorkflow"),
                "WorkflowUtilitiesForSwiftXML",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "ZIPFoundation", package: "ZIPFoundationModern"),
            ],
            swiftSettings: [
                .enableUpcomingFeature("ConciseMagicFile"),
            ]
        ),
    ]
)
