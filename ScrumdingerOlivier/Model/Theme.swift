// MARK: - LIBRARIES
import SwiftUI



enum Theme: String,
            CaseIterable,
            Identifiable {
    
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var accentColor: Color {
        
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow:
            return .black
        case .indigo, .magenta, .navy, .oxblood, .purple:
            return .white
        }
    }
    
    
    /// Add a `Color` property named `mainColor`
    ///  that creates a color using the enumeration’s rawValue.
    ///  This property initializes a color from the asset catalog.
    var mainColor: Color {
        Color(rawValue)
    }
    
    
    var name: String {
        rawValue.capitalized
    }
    
    
    var id: String {
        return name
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}
