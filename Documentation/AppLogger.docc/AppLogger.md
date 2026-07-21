# ``AppLogger``

AppLogger is a small wrapper around Apple's unified logging APIs. It provides an app-facing log-level abstraction, explicit public/private message logging, and reusable formatters for concise timestamps and durations.

## Getting started

Create a logger with a subsystem and category, then log messages at the appropriate level:

```swift
import AppLogger

let logger = AppLogger(subsystem: "com.example.app", category: "network")
logger.log("Request started")
logger.log(level: .error, "Request failed", isPrivate: false)
```

Use `isPrivate: true` for values that should be redacted by the unified logging system outside an attached debugger.

## Topics

### Logging

- ``AppLogger``
- ``AppLogLevel``

### Log formatting

- `Date.formattedLogTimestamp(locale:timeZone:)`
- `TimeInterval.formattedLogDuration()`
