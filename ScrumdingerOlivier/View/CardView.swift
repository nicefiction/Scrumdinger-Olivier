// MARK: - LIBRARIES
import SwiftUI
/*
 struct DailyScrum {
     
     // MARK: - NESTED TYPES
     // MARK: - STATIC PROPERTIES
     // MARK: - PROPERTY WRAPPERS
     // MARK: - PROPERTIES
     let title: String
     let attendees: Array<String>
     let lengthInMinutes: Int
     let theme: Theme
 */


struct CardView: View {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let dailyScrum: DailyScrum
    
    
    
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
    
        VStack(alignment: .leading) {
            Text(dailyScrum.title)
                .font(.headline)
            /// This modifier helps convey the information architecture of the view
            /// by reading the scrum title, followed by “heading.”:
                .accessibilityAddTraits(.isHeader)
            HStack {
                Label("\(dailyScrum.attendees.count)",
                      systemImage: "person.3.fill")
                .accessibilityLabel("\(dailyScrum.attendees.count) attendees")
                Spacer()
                Label("\(dailyScrum.lengthInMinutes)",
                      systemImage: "clock")
                .accessibilityLabel("\(dailyScrum.lengthInMinutes) minute meeting")
//                    .padding(.trailing, 20)
                .labelStyle(.trailingIcon)
                /// The clock icon now aligns on the trailing edge,
                /// mirroring the leading label for the number of attendees.
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(dailyScrum.theme.accentColor)
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS
struct CardView_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    static var dailyScrum = DailyScrum.sampleData[0]
    
    
    
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        CardView(dailyScrum: dailyScrum)
            .background(dailyScrum.theme.mainColor)
            .previewLayout(
                .fixed(width: 400,
                       height: 60)
            )
    }
}
