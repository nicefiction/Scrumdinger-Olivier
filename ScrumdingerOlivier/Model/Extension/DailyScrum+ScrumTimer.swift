// MARK: - LIBRARIES
import Foundation



extension DailyScrum {
    
    /// A new `ScrumTimer` using the meeting length and attendees in the `DailyScrum`.
    var timer: ScrumTimer {
        ScrumTimer(lengthInMinutes: lengthInMinutes,
                   attendees: attendees)
    }
}
