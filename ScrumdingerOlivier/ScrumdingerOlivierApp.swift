// MARK: - LIBRARIES
import SwiftUI



@main
struct ScrumdingerOlivierApp: App {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // @State private var dailyScrums = DailyScrum.sampleData
    @StateObject private var scrumStore = ScrumStore()
    @State private var errorWrapper: ErrorWrapper?
    
    
    
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
                            // fatalError("Error saving scrums.")
                            errorWrapper = ErrorWrapper(error: error,
                                                        guidance: "Try again later.")
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
                    // fatalError("Error loading scrums.")
                    errorWrapper = ErrorWrapper(error: error, guidance: "Scrumdinger will load sample data and continue.")
                }
            }
            .sheet(item: $errorWrapper, onDismiss: {
                scrumStore.dailyScrums = DailyScrum.sampleData
            }) { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
        }
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
    // MARK: - INITIALIZERS
}





/*
 // MARK: - STATIC PROPERTIES
 // MARK: - PROPERTY WRAPPERS
 // MARK: - PROPERTIES
 // MARK: - COMPUTED PROPERTIES
 var body: some View {
 
     Text("Hello, world!")
 }
 
 
 
 // MARK: - STATIC METHODS
 // MARK: - INITIALIZERS
 // MARK: - METHODS
 // MARK: - HELPER METHODS
 */
/*
 // MARK: - STATIC PROPERTIES
 // MARK: - PROPERTY WRAPPERS
 // MARK: - PROPERTIES
 // MARK: - COMPUTED PROPERTIES
 // MARK: - STATIC METHODS
 // MARK: - INITIALIZERS
 // MARK: - METHODS
 // MARK: - HELPER METHODS
 */
/*
 // MARK: - PREVIEWS
 
 // MARK: - STATIC PROPERTIES
 // MARK: - COMPUTED PROPERTIES
 */
