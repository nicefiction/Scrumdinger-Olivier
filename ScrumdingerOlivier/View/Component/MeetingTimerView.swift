// MARK: - LIBRARIES
import SwiftUI



struct MeetingTimerView: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let speakers: Array<ScrumTimer.Speaker>
    let isRecording: Bool
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
                    Image(systemName: isRecording ? "mic" : "mic.slash")
                        .font(.title)
                        .padding(.top)
                        .accessibilityLabel(isRecording ? "with transcription" : "without transcription")
                }
                    .accessibilityElement(children: .combine)
                    .foregroundStyle(theme.accentColor)
            )
            .overlay {
                ForEach(speakers) { (eachSpeaker: ScrumTimer.Speaker) in
                    /// The `if` statement  checks whether the speaker is finished
                    /// and uses optional binding to find the index of the speaker:
                    if eachSpeaker.isCompleted,
                       let index = speakers.firstIndex(where: { $0.id == eachSpeaker.id }) {
                        SpeakerArc(speakerIndex: index,
                                   totalSpeakers: speakers.count)
                        .rotation(Angle.degrees(-90.00))
                        /// The `stroke` modifier traces a line along the path of the shape:
                        .stroke(theme.mainColor,
                                lineWidth: 12)
                    }
                }
            }
            .padding(.horizontal)
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
    // MARK: - INITIALIZERS
}





// MARK: - PREVIEWS
struct MeetingTimerView_Previews: PreviewProvider {
    
    // MARK: - COMPUTED PROPERTIES
    static var speakers: [ScrumTimer.Speaker] {
        [ScrumTimer.Speaker(name: "Bill", isCompleted: true),
         ScrumTimer.Speaker(name: "Cathy", isCompleted: false)]
    }
    
    
    static var previews: some View {
        
        MeetingTimerView(speakers: speakers,
                         isRecording: true,
                         theme: Theme.yellow)
    }
}
