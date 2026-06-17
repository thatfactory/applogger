import os

/// Represents the supported logging levels exposed by ``AppLogger``.
public enum AppLogLevel: Sendable {
    case debug
    case `default`
    case error
    case fault
    case info

    var osLogType: OSLogType {
        switch self {
        case .info:
            return .info
        case .default:
            return .default
        case .debug:
            return .debug
        case .error:
            return .error
        case .fault:
            return .fault
        }
    }
}
