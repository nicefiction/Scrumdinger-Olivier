// MARK: - LIBRARIES
import SwiftUI



struct DetailView: View {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @State private var isPresentingEditView: Bool = false
    @State private var data = DailyScrum.Data.init()
    @Binding var dailyScrum: DailyScrum
    
    
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
    
        List {
            Section("meeting info") {
                NavigationLink(destination: {MeetingView(dailyScrum: $dailyScrum)},
                               label: {
                    Label("Start Meeting",
                          systemImage: "timer")
                        .font(.headline)
                    .foregroundColor(.accentColor)
                })
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
            
            Section(header: Text("history")) {
                if dailyScrum.history.isEmpty {
                    Label("No meetings have taken place yet.",
                          systemImage: "calendar.badge.exclamationmark")
                }
                ForEach(dailyScrum.history) { (eachHistory: History) in
                    HStack {
                        Image(systemName: "calendar")
                        Text(eachHistory.date,
                             style: .date)
                    }
                }
            }
        }
        .navigationTitle(dailyScrum.title)
        .toolbar {
            Button("Edit",
                   action: {
                isPresentingEditView.toggle()
                data = dailyScrum.data
            })
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView(data: $data)
                    .navigationTitle(dailyScrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView.toggle() // false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                dailyScrum.update(from: data)
                            }
                        }
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
            
            DetailView(dailyScrum: .constant(DailyScrum.sampleData[0]))
        }
    }
}
