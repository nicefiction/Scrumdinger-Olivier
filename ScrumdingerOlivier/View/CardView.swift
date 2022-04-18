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
            HStack {
                Label("\(dailyScrum.attendees.count)",
                      systemImage: "person.3.fill")
                Spacer()
                Label("\(dailyScrum.lengthInMinutes)",
                      systemImage: "clock")
                    .padding(.trailing, 20)
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
