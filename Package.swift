// swift-tools-version:6.4

import PackageDescription

let package = Package(
    name: "AppLogger",
    platforms: [
        .iOS(.v27),
        .macOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27)
    ],
    products: [
        .library(
            name: "AppLogger",
            targets: ["AppLogger"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AppLogger",
            dependencies: []
        ),
        .testTarget(
            name: "AppLoggerTests",
            dependencies: ["AppLogger"]
        )
    ]
)
