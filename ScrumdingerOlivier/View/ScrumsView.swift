// MARK: - LIBRARIES
import SwiftUI



struct ScrumsView: View {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    @State private var isPresentingNewScrumView: Bool = false
    @State private var newScrumData = DailyScrum.Data.init()
    /// The `newScrumData` property is the source of truth
    /// for all the changes the user makes to the new scrum.
    @Binding var dailyScrums: Array<DailyScrum>
    
    
    
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
    
        List {
            ForEach($dailyScrums) { $eachDailyScrum in
                NavigationLink(destination: DetailView(dailyScrum: $eachDailyScrum)) {
                    CardView(dailyScrum: eachDailyScrum)
                }
                .listRowBackground(eachDailyScrum.theme.mainColor)
            }
        }
        .navigationTitle("Daily Scrums")
        .toolbar {
            Button(action: {
                isPresentingNewScrumView.toggle()
            },
                   label: {
                Image(systemName: "plus.circle")
            })
            .accessibilityLabel("New Scrum")
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NavigationView {
                DetailEditView(data: $newScrumData)
                    .toolbar(content: {
                        ToolbarItem(placement: .cancellationAction,
                                    content: {
                            Button("Cancel",
                                   action: {
                                isPresentingNewScrumView = false
                                newScrumData = DailyScrum.Data.init()
                            })
                        })
                        ToolbarItem(placement: .confirmationAction,
                                    content: {
                            Button("Add",
                                   action: {
                                let newDailyScrum = DailyScrum.init(data: newScrumData)
                                dailyScrums.append(newDailyScrum)
                                isPresentingNewScrumView = false
                                newScrumData = DailyScrum.Data.init()
                            })
                        })
                    })
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
        
        NavigationView {
            
            ScrumsView(dailyScrums: .constant(DailyScrum.sampleData))
        }
        //.navigationTitle("Scrumdinger")
    }
}
