// MARK: - LIBRARIES
import SwiftUI



struct MeetingTimerView: View {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let speakers: Array<ScrumTimer.Speaker>
    let theme: Theme
    
    
    
    // MARK: - COMPUTED PROPERTIES
    private var currentSpeaker: String {
        speakers.first(where: { !$0.isCompleted })?.name ?? "Someone"
        /// The current speaker is the first person on the list who hasn’t spoken.
        /// If there isn’t a current speaker,
        /// the expression returns `“Someone”`
    }
    
    
    var body: some View {
    
        Circle()
            .strokeBorder(lineWidth: 24.0)
            .overlay(
                VStack {
                    Text(currentSpeaker)
                        .font(.title)
                    Text("is speaking")
                }
                    .accessibilityElement(children: .combine)
                    .foregroundStyle(theme.accentColor)
            )
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
    // MARK: - INITIALIZERS
}





// MARK: - PREVIEWS
struct MeetingTimerView_Previews: PreviewProvider {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var speakers: [ScrumTimer.Speaker] {
        [ScrumTimer.Speaker(name: "Bill", isCompleted: true),
         ScrumTimer.Speaker(name: "Cathy", isCompleted: false)]
    }
    
    
    static var previews: some View {
        
        MeetingTimerView(speakers: speakers, theme: Theme.yellow)
    }
    // MARK: - INITIALIZERS
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
    
}
