// MARK: - LIBRARIES
import SwiftUI



struct ScrumProgressViewStyle: ProgressViewStyle {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    var theme: Theme
    
    
    
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
    
        Text("Hello, world!")
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    func makeBody(configuration: Configuration)
    -> some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(theme.accentColor)
                .frame(height: 20.0)
            if #available(iOS 15.0, *) {
                ProgressView(configuration)
                    .tint(theme.mainColor)
                    .frame(height: 12.0)
                    .padding(.horizontal)
            } else {
                ProgressView(configuration)
                    .frame(height: 12.0)
                    .padding(.horizontal)
            }
        }
    }
    
    
    
    // MARK: - HELPER METHODS
}






// MARK: - PREVIEWS
struct ScrumProgressViewStyle_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ProgressView(value: 0.4)
            .progressViewStyle(ScrumProgressViewStyle(theme: .buttercup))
            .previewLayout(.sizeThatFits)
    }
}
