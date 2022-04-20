// MARK: - LIBRARIES
import Foundation



extension Array
where Element == DailyScrum.Attendee {
    
    var speakers: [ScrumTimer.Speaker] {
        if isEmpty {
            return [ScrumTimer.Speaker(name: "Speaker 1",
                                       isCompleted: false)]
        } else {
            return map { ScrumTimer.Speaker(name: $0.name,
                                            isCompleted: false) }
        }
    }
}
