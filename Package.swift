// swift-tools-version:6.4

import PackageDescription

let package = Package(
    name: "AppLogger",
    platforms: [
        .iOS(.v26),
        .macOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26)
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
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "AppLoggerTests",
            dependencies: ["AppLogger"]
        )
    ]
)
