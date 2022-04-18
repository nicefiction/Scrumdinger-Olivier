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
                CardView(dailyScrum: eachDailyScrum)
                    .listRowBackground(eachDailyScrum.theme.mainColor)
            }
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
        
        ScrumsView(dailyScrums: DailyScrum.sampleData)
    }
}
