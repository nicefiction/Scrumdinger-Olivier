// MARK: - LIBRARIES

import Foundation
import SwiftUI



struct SpeakerArc: Shape {
    
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let speakerIndex: Int
    let totalSpeakers: Int
    
    
    
    // MARK: - COMPUTED PROPERTIES
    private var degreesPerSpeaker: Double {
        return 360.0 / Double(totalSpeakers)
    }
    
    
    private var startAngle: Angle {
        return Angle(degrees: degreesPerSpeaker * Double(speakerIndex) + 1.0)
    }
    
    
    private var endAngle: Angle {
        return Angle(degrees: startAngle.degrees + degreesPerSpeaker - 1.0)
    }
    
    
    
    // MARK: - INITIALIZERS
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    func path(in rect: CGRect)
    -> Path {
        
        let diameter = min(rect.size.width,
                           rect.size.height) - 24.0
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.midX,
                             y: rect.midY)
        
        return Path { path in
            path.addArc(center: center,
                        radius: radius,
                        startAngle: startAngle,
                        endAngle: endAngle,
                        clockwise: false)
        }
    }
    
    
    
    // MARK: - HELPER METHODS
}
