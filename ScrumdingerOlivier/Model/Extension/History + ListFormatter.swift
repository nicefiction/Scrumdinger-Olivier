// MARK: - LIBRARIES
import Foundation



extension History {
    
    var attendeeString: String {
        /// `ListFormatter` converts the attendees data into a single, comma-separated string.
        ListFormatter.localizedString(byJoining: attendees.map { $0.name })
    }
}
