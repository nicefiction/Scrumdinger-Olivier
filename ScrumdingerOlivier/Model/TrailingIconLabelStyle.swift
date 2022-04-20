// MARK: LIBRARIES
import Foundation
import SwiftUI



struct TrailingIconLabelStyle: LabelStyle {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    func makeBody(configuration: Configuration)
    -> some View {
        
        HStack {
            configuration.title
            configuration.icon
        }
    }
    
    
    
    // MARK: - HELPER METHODS
}
