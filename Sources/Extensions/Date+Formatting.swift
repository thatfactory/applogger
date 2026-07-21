import Foundation

public extension Date {
    /// Formats the date as `dd/MM HH:mm:ss` for concise logging output.
    nonisolated
    func formattedLogTimestamp(
        locale: Locale = .autoupdatingCurrent,
        timeZone: TimeZone = .autoupdatingCurrent
    ) -> String {
        var dateStyle = Date.FormatStyle()
            .day(.twoDigits)
            .month(.twoDigits)
            .locale(locale)
        dateStyle.timeZone = timeZone

        var timeStyle = Date.FormatStyle()
            .hour()
            .minute()
            .second()
            .locale(locale)
        timeStyle.timeZone = timeZone

        return "\(formatted(dateStyle)) \(formatted(timeStyle))"
    }
}
