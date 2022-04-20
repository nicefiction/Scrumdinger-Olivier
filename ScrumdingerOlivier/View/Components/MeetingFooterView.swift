// MARK: - LIBRARIES
import SwiftUI



struct MeetingFooterView: View {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let speakers: Array<ScrumTimer.Speaker>
    var skipAction: () -> Void
    /// You’ll use `skipAction` to allow users to skip to the next speaker.
    
    

    // MARK: - COMPUTED PROPERTIES
    /// `ScrumTimer` marks each speaker as completed when their time has ended.
    /// The first speaker not marked as completed becomes the active speaker.
    /// The `speakerNumber` property uses the index to return the active speaker number,
    /// which you’ll use as part of the footer text:
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted })
        else { return nil }
        
        return index + 1
    }
    
    
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy { $0.isCompleted }
        /// You can get the same result with `reduce(_:_:)`
        /// by returning `speakers.dropLast().reduce(true) { $0 && $1.isCompleted }`.
    }
    
    
    private var speakerText: String {
        guard let speakerNumber = speakerNumber
        else { return "No more speakers" }
        
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
    
    
    var body: some View {
    
        VStack {
            HStack {
                if isLastSpeaker {
                    Text("Last speaker")
                } else {
                    Text(speakerText)
                    Spacer()
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
    // MARK: - INITIALIZERS
}





// MARK: - PREVIEWS
struct MeetingFooterView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers,
                          skipAction: {})
            .previewLayout(.sizeThatFits)
    }
}
