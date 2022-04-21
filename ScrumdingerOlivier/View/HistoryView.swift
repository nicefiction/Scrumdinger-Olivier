// MARK: - LIBRARIES
import SwiftUI



struct HistoryView: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let history: History
    
    
    
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
    
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                Text("Attendees")
                    .font(.headline)
                Text(history.attendeeString)
                if let transcript = history.transcript {
                    Text("Transcript")
                    Text(transcript)
                        .font(.headline)
                        .padding(.top)
                }
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS
struct HistoryView_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    static var attendees = [
        DailyScrum.Attendee(name: "Jon"),
        DailyScrum.Attendee(name: "Darla"),
        DailyScrum.Attendee(name: "Luis")
    ]
    
    
    static var history: History {
        History(attendees: attendees,
                lengthInMinutes: 10,
                transcript: "Darla, would you like to start today? Sure, yesterday I reviewed Luis' PR and met with the design team to finalize the UI...")
    }
    
    
    
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        HistoryView(history: history)
    }
}
