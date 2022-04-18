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





extension LabelStyle
where Self == TrailingIconLabelStyle {
    
    // MARK: - STATIC PROPERTIES
    /// Because you defined the label style as a `static` property,
    /// you can call it using leading-dot syntax,
    /// which makes your code more readable:
    static var trailingIcon: Self { Self.init() }

    
    
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    // MARK: - STATIC METHODS
    // MARK: - METHODS
}
