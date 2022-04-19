// MARK: - LIBRARIES
import SwiftUI



struct DetailView: View {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let dailyScrum: DailyScrum
    
    
    
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
    
        List {
            Section("meeting info") {
                Label("Start Meeting",
                      systemImage: "timer")
                    .font(.headline)
                    .foregroundColor(.accentColor)
                HStack {
                    Label("Length",
                          systemImage: "clock")
                    Spacer()
                    Text("\(dailyScrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                /// VoiceOver then reads the two elements as one statement,
                /// for example, “Length, 10 minutes.”
                /// Without the modifier,
                /// VoiceOver users have to swipe again between each element.
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(dailyScrum.theme.name)
                        .padding(4)
                        .foregroundColor(dailyScrum.theme.accentColor)
                        .background(dailyScrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("attendees")) {
                ForEach(dailyScrum.attendees) { (eachAttendee: DailyScrum.Attendee) in
                    Label(eachAttendee.name, systemImage: "person")
                }
            }
        }
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS
struct DetailView_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        NavigationView {
            
            DetailView(dailyScrum: DailyScrum.sampleData[0])
        }
    }
}
