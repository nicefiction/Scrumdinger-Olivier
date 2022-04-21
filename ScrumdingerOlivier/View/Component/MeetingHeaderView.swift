// MARK: - LIBRARIES
import SwiftUI



struct MeetingHeaderView: View {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let secondsElapsed: Int
    let secondsRemaining: Int
    let theme: Theme
    
    
    
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    private var totalSeconds: Int {
        return secondsElapsed + secondsRemaining
    }
    
    private var progress: Double {
        guard totalSeconds > 0
        else { return 1 }
        
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    
    
    private var minutesRemaining: Int {
        return secondsRemaining / 60
    }
    
    
    var body: some View {
    
        VStack {
            ProgressView.init(value: progress)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)",
                          systemImage: "hourglass.bottomhalf.filled")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRemaining)",
                          systemImage: "hourglass.tophalf.filled")
                    .labelStyle(.trailingIcon)
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaining) minutes")
        .padding([.top, .horizontal])
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS
struct MeetingHeaderView_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        MeetingHeaderView(secondsElapsed: 60,
                          secondsRemaining: 180,
                          theme: Theme.bubblegum)
            .previewLayout(.sizeThatFits)
    }
}
