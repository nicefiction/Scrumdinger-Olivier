// MARK: - LIBRARIES
import Foundation


struct History: Identifiable,
                Codable {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let id: UUID
    let date: Date
    var attendees: Array<DailyScrum.Attendee>
    var lengthInMinutes: Int
    var transcript: String?
    
    
    
    // MARK: - INITIALIZERS
    init(id: UUID = UUID.init(),
         date: Date = Date.init(),
         attendees: Array<DailyScrum.Attendee>,
         lengthInMinutes: Int = 5,
         transcript: String? = nil) {
        
        self.id              = id
        self.date            = date
        self.attendees       = attendees
        self.lengthInMinutes = lengthInMinutes
        self.transcript      = transcript
    }
    
    
    
    // MARK: - COMPUTED PROPERTIES
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}
