// MARK: - LIBRARIES
import SwiftUI



@main
struct ScrumdingerOlivierApp: App {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @State private var dailyScrums = DailyScrum.sampleData
    
    
    
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    var body: some Scene {
        /// `WindowGroup` is one of the primitive scenes that SwiftUI provides.
        /// In iOS, the views you add to the `WindowGroup` scene builder
        /// are presented in a window that fills the device’s entire screen:
        WindowGroup {
            
            NavigationView {
                ScrumsView(dailyScrums: $dailyScrums)
            }
        }
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
    // MARK: - INITIALIZERS
}





/*
 // MARK: - NESTED TYPES
 // MARK: - STATIC PROPERTIES
 // MARK: - PROPERTY WRAPPERS
 // MARK: - PROPERTIES
 // MARK: - COMPUTED PROPERTIES
 var body: some View {
 
     Text("Hello, world!")
 }
 
 
 
 // MARK: - STATIC METHODS
 // MARK: - METHODS
 // MARK: - HELPER METHODS
 // MARK: - INITIALIZERS
 */
/*
 // MARK: - NESTED TYPES
 // MARK: - STATIC PROPERTIES
 // MARK: - PROPERTY WRAPPERS
 // MARK: - PROPERTIES
 // MARK: - COMPUTED PROPERTIES
 // MARK: - STATIC METHODS
 // MARK: - METHODS
 // MARK: - HELPER METHODS
 // MARK: - INITIALIZERS
 */
/*
 // MARK: - PREVIEWS
 
 // MARK: - STATIC PROPERTIES
 // MARK: - COMPUTED PROPERTIES
 */
