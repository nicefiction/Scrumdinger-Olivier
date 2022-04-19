//
//  DetailEditView.swift
//  ScrumdingerOlivier
//
//  Created by Olivier Van hamme on 19/04/2022.
//

import SwiftUI

struct DetailEditView: View {

    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    @State private var data = DailyScrum.Data.init()
    @State private var newAttendeeName: String = ""
    
    
    
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
    
        Form {
            Section(header: Text("Meeting Info")) {
                TextField("Title",
                          text: $data.title)
                HStack {
                    Slider(value: $data.lengthInMinutes,
                           in: 5...30,
                           step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(Int(data.lengthInMinutes)) minutes")
                    Spacer()
                    Text("\(Int(data.lengthInMinutes)) minutes")
                    /// Hide the `Text `View from VoiceOver:
                        .accessibilityHidden(true)
                }
            }
            Section(header: Text("Attendees")) {
                ForEach(data.attendees) { (eachAttendee: DailyScrum.Attendee) in
                    Text(eachAttendee.name)
                }
                .onDelete(perform: { (attendeeAtIndex: IndexSet) in
                    data.attendees.remove(atOffsets: attendeeAtIndex)
                })
                HStack {
                    TextField("New Attendee",
                              text: $newAttendeeName)
                    Button(action: {
                        withAnimation {
                            let newAttendee = DailyScrum.Attendee.init(name: newAttendeeName)
                            data.attendees.append(newAttendee)
                            newAttendeeName = ""
                            /// Because the text field has a binding to `newAttendeeName`,
                            /// setting the value to the empty string
                            /// also clears the contents of the text field.
                        }
                    },
                           label: {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    })
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}






// MARK: - PREVIEWS
struct DetailEditView_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        DetailEditView()
    }
}
