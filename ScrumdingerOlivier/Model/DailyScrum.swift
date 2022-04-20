// MARK: - LIBRARIES
import Foundation



struct DailyScrum: Identifiable,
                   Codable {
    
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
