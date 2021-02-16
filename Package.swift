// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EasySwiftLayout",
    platforms: [.iOS(.v9)],
    products: [
        .library(
            name: "EasySwiftLayout",
            targets: ["EasySwiftLayoutTarget"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "EasySwiftLayoutTarget",
            path: "Sources",
            exclude: ["Info.plist"]
        )
    ]
)