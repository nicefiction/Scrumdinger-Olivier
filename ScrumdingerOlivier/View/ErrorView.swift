// MARK: - LIBRARIES
import SwiftUI



struct ErrorView: View {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    /// With the `@Environment `property wrapper,
    /// you can read a value that the view’s environment stores,
    /// such as the view’s presentation mode, scene phase, visibility, or color scheme.
    /// In this case, you access the view’s dismiss structure
    /// and call it like a function to dismiss the view:
    @Environment(\.dismiss) private var dismiss
    
    
    
    // MARK: - PROPERTIES
    let errorWrapper: ErrorWrapper
    
    
    
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
    
        NavigationView {
            VStack {
                Text("An error has occured.")
                    .font(.title)
                    .padding(.bottom)
                Text(errorWrapper.error.localizedDescription)
                    .font(.headline)
                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding(.top)
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(16.0)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
    // MARK: - INITIALIZERS
}





// MARK: - PREVIEWS
struct ErrorView_Previews: PreviewProvider {
    
    // MARK: - NESTED TYPES
    enum SampleError: Error {
        case errorRequired
    }
    
    
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var wrapper: ErrorWrapper {
        ErrorWrapper(error: SampleError.errorRequired,
                     guidance: "You can safely ignore this error.")
    }
    
    
    static var previews: some View {
        
        ErrorView(errorWrapper: wrapper)
    }
    
    
    
    // MARK: - INITIALIZERS
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
    
}
