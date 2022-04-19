// MARK: - LIBRARIES
import SwiftUI

/// TIP:
/// You might define a list cell in the same file as the list view structure.
/// By defining the cell in a separate file,
/// you can more easily reuse it in a future project.

struct ThemeView: View {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    /// The model for this view is a single instance of Theme:
    let theme: Theme
    
    
    
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
    
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(theme.mainColor)
            Label(theme.name,
                  systemImage: "paintpalette.fill")
            .padding(4)
        }
        .foregroundColor(theme.accentColor)
        .fixedSize(horizontal: false,
                   vertical: true)
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}






// MARK: - PREVIEWS
struct ThemeView_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        ThemeView(theme: Theme.buttercup)
    }
}
