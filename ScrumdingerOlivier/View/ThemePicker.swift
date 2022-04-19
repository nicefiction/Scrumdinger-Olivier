// MARK: LIBRARIES
import SwiftUI

/// Try to maintain a single source of truth for every piece of data in your app.
/// Instead of creating a new source of truth for the theme picker,
/// you’ll use a binding that references a theme structure defined in the parent view.


struct ThemePicker: View {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @Binding var selection: Theme
    
    
    
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
    
        Picker("Theme",
               selection: $selection) {
            ForEach(Theme.allCases) { (eachColorTheme: Theme) in
                ThemeView(theme: eachColorTheme)
                    .tag(eachColorTheme)
            }
        }
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS
struct ThemePicker_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        ThemePicker(selection: .constant(Theme.periwinkle))
    }
}
