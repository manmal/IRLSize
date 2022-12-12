// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "IRLSize",
    platforms: [
        .iOS(.v13),
        .watchOS(.v4)
    ],
    products: [
        .library(
            name: "IRLSize",
            targets: ["IRLSize"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "IRLSize",
            dependencies: [],
            publicHeadersPath: "Headers"),
    ]
)
