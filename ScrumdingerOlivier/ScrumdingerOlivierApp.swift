// MARK: - LIBRARIES
import SwiftUI



@main
struct ScrumdingerOlivierApp: App {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // @State private var dailyScrums = DailyScrum.sampleData
    @StateObject private var scrumStore = ScrumStore()
    
    
    
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    var body: some Scene {
        /// `WindowGroup` is one of the primitive scenes that SwiftUI provides.
        /// In iOS, the views you add to the `WindowGroup` scene builder
        /// are presented in a window that fills the device’s entire screen:
        WindowGroup {
            
            NavigationView {
                // ScrumsView(dailyScrums: $dailyScrums)
                ScrumsView(dailyScrums: $scrumStore.dailyScrums) {
//                    ScrumStore.save(scrums: scrumStore.dailyScrums) { result in
//                        if case .failure(let error) = result {
//                            fatalError(error.localizedDescription)
//                        }
//                    }
                    /// `Task` creates a new asynchronous context:
                    Task {
                        do {
                            try await ScrumStore.save(scrums: scrumStore.dailyScrums)
                        } catch let error {
                            print(error.localizedDescription)
                            fatalError("Error saving scrums.")
                        }
                    }
                }
            }
//            .onAppear {
//                ScrumStore.load { result in
//                    switch result {
//                    case .failure(let error):
//                        fatalError(error.localizedDescription)
//                    case .success(let dailyScrums):
//                        scrumStore.dailyScrums = dailyScrums
//                    }
//                }
//            }
            .task {
                do {
                    scrumStore.dailyScrums = try await ScrumStore.load()
                } catch {
                    fatalError("Error loading scrums.")
                }
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
 // MARK: - INITIALIZERS
 // MARK: - STATIC METHODS
 // MARK: - METHODS
 // MARK: - HELPER METHODS
 */
/*
 // MARK: - PREVIEWS
 
 // MARK: - STATIC PROPERTIES
 // MARK: - COMPUTED PROPERTIES
 */
