<p align="center">
  <a href="https://developer.apple.com/swift/"><img alt="Swift" src="https://img.shields.io/badge/Swift-6.3-ea7a50.svg?logo=swift&logoColor=white"></a>
  <a href="https://developer.apple.com/xcode/"><img alt="Xcode" src="https://img.shields.io/badge/Xcode-27-50ace8.svg?logo=xcode&logoColor=white"></a>
  <a href="https://developer.apple.com/documentation/xcode/swift-packages"><img alt="SPM" src="https://img.shields.io/badge/SPM-ready-b68f6a.svg?logo=gitlfs&logoColor=white"></a>
  <a href="https://en.wikipedia.org/wiki/List_of_Apple_operating_systems"><img alt="Platforms" src="https://img.shields.io/badge/Platforms-iOS%20%7C%20iPadOS%20%7C%20macOS%20%7C%20tvOS%20%7C%20watchOS-lightgrey.svg?logo=apple&logoColor=white"></a>
  <a href="https://en.wikipedia.org/wiki/MIT_License"><img alt="License" src="https://img.shields.io/badge/License-MIT-67ac5b.svg?logo=googledocs&logoColor=white"></a>
  <a href="https://github.com/thatfactory/applogger/actions/workflows/ci.yml"><img alt="CI" src="https://github.com/thatfactory/applogger/actions/workflows/ci.yml/badge.svg"></a>
  <a href="https://github.com/thatfactory/applogger/actions/workflows/release.yml"><img alt="Release" src="https://github.com/thatfactory/applogger/actions/workflows/release.yml/badge.svg"></a>
</p>

# AppLogger
Wrapper around Apple's Swift unified logging APIs, particularly [Logger](https://developer.apple.com/documentation/os/logger).

Provides `public` and `private` logging with an app-facing `AppLogLevel` abstraction, so clients do not need to import `os` to choose a log level. The default level is `.default`, which maps to `OSLogType.default` and shows up in Console.app without requiring debug filtering.

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

let logger = AppLogger(subsystem: "com.example.app", category: "network")

// Log public information.
logger.log("Request started")

// Log private information.
logger.log(level: .info, "Request headers: \(headers)", isPrivate: true)

// Set custom levels.
logger.log(level: .error, "Request failed: \(error.localizedDescription)")
```

### Defaults
```swift
public struct Defaults {
    public static let subsystem = Bundle.main.bundleIdentifier ?? "AppLogger"
    public static let category = "default"
    public static let isPrivate = false
    public static let level: AppLogLevel = .default
}
```

### AppLogLevel
```swift
public enum AppLogLevel {
    case debug
    case info
    case `default`
    case error
    case fault
}
```

### Output

#### Xcode console
![Xcode Sample](https://i.imgur.com/6TNaUQo.png)

#### macOS Console app
`.default`, `.error`, and `.fault` logs are shown by default in the **Console app**. If you emit `debug` logs, enable `Action / Include Info/Debug Messages` to display them.

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
