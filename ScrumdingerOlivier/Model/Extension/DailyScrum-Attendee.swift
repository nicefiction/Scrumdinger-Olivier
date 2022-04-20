// MARK: - LIBRARIES
import Foundation



extension DailyScrum {
    
    // MARK: - NESTED TYPES
    struct Attendee: Identifiable,
                     Codable {
        
        // MARK: - NESTED TYPES
        // MARK: - STATIC PROPERTIES
        // MARK: - PROPERTY WRAPPERS
        // MARK: - PROPERTIES
        let id: UUID
        var name: String
        
        
        
        // MARK: - INITIALIZERS
        init(id: UUID = UUID.init(),
             name: String) {
            
            self.id   = id
            self.name = name
        }
        // MARK: - COMPUTED PROPERTIES
        // MARK: - STATIC METHODS
        // MARK: - METHODS
        // MARK: - HELPER METHODS
    }
}
