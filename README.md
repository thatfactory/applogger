[![Swift](https://img.shields.io/badge/swift-6.2-ea7a50.svg?logo=swift&logoColor=white)](https://developer.apple.com/swift/)
[![Xcode](https://img.shields.io/badge/xcode-26.2-50ace8.svg?logo=xcode&logoColor=white)](https://developer.apple.com/xcode/)
[![SPM](https://img.shields.io/badge/spm-ready-b68f6a.svg?logo=gitlfs&logoColor=white)](https://developer.apple.com/documentation/xcode/swift-packages)
[![Platforms](https://img.shields.io/badge/platforms-iOS%20%7C%20iPadOS%20%7C%20macOS%20%7C%20tvOS%20%7C%20watchOS-lightgrey.svg?logo=apple&logoColor=white)](https://en.wikipedia.org/wiki/List_of_Apple_operating_systems)
[![License](https://img.shields.io/badge/license-MIT-67ac5b.svg?logo=googledocs&logoColor=white)](https://en.wikipedia.org/wiki/MIT_License)
[![CI](https://github.com/thatfactory/applogger/actions/workflows/ci.yml/badge.svg)](https://github.com/thatfactory/applogger/actions/workflows/ci.yml)
[![Release](https://github.com/thatfactory/applogger/actions/workflows/release.yml/badge.svg)](https://github.com/thatfactory/applogger/actions/workflows/release.yml)

# AppLogger
Wrapper around Apple's new Swift logging APIs, particularly [Logger](https://developer.apple.com/documentation/os/logger).

Provides a basic `public`/`private` logging functionality at a given level (e.g. `debug` (default)).

For more information, please refer to this WWDC20 video: [Explore logging in Swift](https://developer.apple.com/wwdc20/10168)

## Supported platforms
 - iOS 14+
 - macOS 11+ (BigSur+)
 - Mac Catalyst 14.0+
 - tvOS 14+
 - watchOS 7+
 - Xcode 12.0+

## Usage
```swift
import AppLogger

// Create an instance of the "AppLogger with default options.
let logger = AppLogger()

// Log public information.
logger.log("iPhone screen size: \(screenSize)")

// Log private information.
logger.log("Username: \(username); Password: \(password)", isPrivate: true)
```

### Defaults
```swift
public struct Defaults {
    public static let subsystem = Bundle.main.bundleIdentifier ?? "AppLogger"
    public static let category = "default"
    public static let isPrivate = false
}
```

### Output

#### Xcode console
![Xcode Sample](https://i.imgur.com/6TNaUQo.png)

#### macOS Console app
⚠️ Make sure you have enabled `Action / Include Info/Debug Messages` in the **Console app** in order to see `debug messages` from your app.

![Console App](https://i.imgur.com/XBGOpLP.png)

##### macOS Console app: a note on `.private`
Keep in mind that private information will still be visible in the Console app as clear text if the device is attached to the debugger. [Apparently this is by design](https://stackoverflow.com/a/62903401/584548).

![Console App Private Debugger](https://i.imgur.com/2DgWNA8.png)

## Integration
### Xcode
Use Xcode's [built-in support for SPM](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app).

### Package.swift
In your `Package.swift`, add `AppLogger` as a dependency:
```swift
dependencies: [
    .package(
        url: "https://github.com/thatfactory/applogger",
        from: "0.1.0"
    )
]
```

Associate the dependency with your target:
```swift
targets: [
    .target(
        name: "YourTarget",
        dependencies: [
            .product(
                name: "AppLogger",
                package: "applogger"
            )
        ]
    )
]
```

Run: `swift build`
