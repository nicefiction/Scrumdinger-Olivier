// MARK: - LIBRARIES
import Foundation
import SwiftUI



struct ScrumsListSeparator: ViewModifier {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    /// OPTION 1
    /// You can mark a function or an entire type as available for a specific operating system
    /// using the `@available` attribute:
    // @available(iOS 15.1, *)
    func body(content: Content)
    -> some View {
        /// OPTION 2
        /// With `#available`,
        /// you can execute a piece of code for specific versions of the operating system:
        if #available(iOS 15, *) {
            content
                .listRowSeparator(.hidden)
        } else {
            content
        }
    }
    // MARK: - HELPER METHODS
}
