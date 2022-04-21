// MARK: - LIBRARIES
import Foundation



extension DailyScrum {
    
    // MARK: - NESTED TYPES
    ///By making `Data` a nested type,
    ///you keep `DailyScrum.Data` distinct from
    ///the `Data` structure defined in the `Foundation` framework.
    struct Data {
        
        // MARK: - STATIC PROPERTIES
        // MARK: - PROPERTY WRAPPERS
        // MARK: - PROPERTIES
        var title: String = ""
        var attendees = Array<Attendee>.init()
        var lengthInMinutes: Double = 5.00
        var theme: Theme = .seafoam
        
        
        
        // MARK: - COMPUTED PROPERTIES
        // MARK: - STATIC METHODS
        // MARK: - METHODS
        // MARK: - HELPER METHODS
        // MARK: - INITIALIZERS
    }
}
