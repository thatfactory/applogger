import Foundation

public extension TimeInterval {
    /// Formats a duration for concise logging output.
    nonisolated
    func formattedLogDuration() -> String {
        let clampedSeconds = max(0, Int(self.rounded()))
        let hours = clampedSeconds / 3600
        let minutes = (clampedSeconds % 3600) / 60
        let seconds = clampedSeconds % 60

        if hours > 0 {
            if minutes > 0 {
                return "\(hours)h\(minutes)m"
            }
            return "\(hours)h"
        }

        if minutes > 0 {
            if seconds > 0 {
                return "\(minutes)m\(seconds)s"
            }
            return "\(minutes)m"
        }

        return "\(seconds)s"
    }
}
