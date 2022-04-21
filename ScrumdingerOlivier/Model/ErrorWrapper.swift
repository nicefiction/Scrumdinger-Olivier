// MARK: - LIBRARIES
import Foundation


struct ErrorWrapper: Identifiable {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let id: UUID
    let error: Error
    let guidance: String
    
    
    
    // MARK: - COMPUTED PROPERTIES
    // MARK: - INITIALIZERS
    init(id: UUID = UUID.init(),
         error: Error,
         guidance: String) {
        
            self.id       = id
            self.error    = error
            self.guidance = guidance
        }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}
