// MARK: - LIBRARIES
import SwiftUI



struct ScrumsView: View {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let dailyScrums: Array<DailyScrum>
    
    
    
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
    
        List {
            ForEach(dailyScrums) { (eachDailyScrum: DailyScrum) in
                NavigationLink(destination: DetailView(dailyScrum: eachDailyScrum)) {
                    CardView(dailyScrum: eachDailyScrum)
                }
                .listRowBackground(eachDailyScrum.theme.mainColor)
            }
        }
        .navigationTitle("Daily Scrums")
        .toolbar {
            Button(action: {},
                   label: {
                Image(systemName: "plus.circle")
            })
            .accessibilityLabel("New Scrum")
        }
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS
struct ScrumsView_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        NavigationView {
            
            ScrumsView(dailyScrums: DailyScrum.sampleData)
        }
        //.navigationTitle("Scrumdinger")
    }
}
