import Foundation
import Testing
@testable import AppLogger

/// Verifies log-friendly duration formatting.
@Suite struct TimeIntervalFormattingTests {
    @Test
    func formatsSeconds() {
        #expect(TimeInterval(10).formattedLogDuration() == "10s")
    }

    @Test
    func formatsSingleMinute() {
        #expect(TimeInterval(60).formattedLogDuration() == "1m")
    }

    @Test
    func formatsMinutesAndSeconds() {
        #expect(TimeInterval(334).formattedLogDuration() == "5m34s")
    }

    @Test
    func formatsHoursAndMinutes() {
        #expect(TimeInterval(7320).formattedLogDuration() == "2h2m")
    }
}
