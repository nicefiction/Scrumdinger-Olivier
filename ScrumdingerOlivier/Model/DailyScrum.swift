// MARK: - LIBRARIES
import Foundation



struct DailyScrum: Identifiable {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let id: UUID
    var title: String
    var attendees: Array<Attendee>
    var lengthInMinutes: Int
    var theme: Theme
    var history = Array<History>.init()
    
    
    
    // MARK: - INITIALIZERS
    init(id: UUID = UUID.init(),
         title: String,
         attendees: Array<String>,
         lengthInMinutes: Int,
         theme: Theme) {
        
        self.id = id
        self.title = title
        self.attendees = attendees.map { (eachName: String) in
            Attendee(name: eachName)
            /// Now that attendee names are uniquely identifiable,
            /// you can add the attendees to the detail view.
        }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
    
    
    
    // MARK: - COMPUTED PROPERTIES
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





extension DailyScrum {
    
    // MARK: - NESTED TYPES
    struct Attendee: Identifiable {
        
        // MARK: - NESTED TYPES
        // MARK: - STATIC PROPERTIES
        // MARK: - PROPERTY WRAPPERS
        // MARK: - PROPERTIES
        let id: UUID
        var name: String
        
        
        
        // MARK: - INITIALIZERS
        init(id: UUID = UUID.init(),
             name: String) {
            
            self.id   = id
            self.name = name
        }
        // MARK: - COMPUTED PROPERTIES
        // MARK: - STATIC METHODS
        // MARK: - METHODS
        // MARK: - HELPER METHODS
    }
    
    
    
    ///By making `Data` a nested type,
    ///you keep `DailyScrum.Data` distinct from
    ///the `Data` structure defined in the `Foundation` framework.
    struct Data {
        
        var title: String = ""
        var attendees = Array<Attendee>.init()
        var lengthInMinutes: Double = 5.00
        var theme: Theme = .seafoam
    }
    
    
    
    // MARK: - STATIC PROPERTIES
    static let sampleData: Array<DailyScrum> = [
        
        DailyScrum(title: "Design",
                   attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
                   lengthInMinutes: 10,
                   theme: .yellow),
        DailyScrum(title: "App Dev",
                   attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"],
                   lengthInMinutes: 5,
                   theme: .orange),
        DailyScrum(title: "Web Dev",
                   attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
                   lengthInMinutes: 5,
                   theme: .poppy)
    ]
    
    
    
    // MARK: - INITIALIZERS
    init(data: Data) {
        
        self.id              = UUID()
        self.title           = data.title
        self.attendees       = data.attendees
        self.lengthInMinutes = Int(data.lengthInMinutes)
        self.theme           = data.theme
    }
    
    
    
    // MARK: - COMPUTED PROPERTIES
    var data: Data {
        
        return Data.init(title: title,
                         attendees: attendees,
                         lengthInMinutes: Double(lengthInMinutes),
                         theme: theme)
    }
        
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    mutating func update(from data: Data)
    -> Void {
        
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        theme = data.theme
    }
    
    
    
    // MARK: - HELPER METHODS
}
