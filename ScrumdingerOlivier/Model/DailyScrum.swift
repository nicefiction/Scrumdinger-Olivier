//
//  DailyScrum.swift
//  ScrumdingerOlivier
//
//  Created by Olivier Van hamme on 18/04/2022.
//

import Foundation



struct DailyScrum: Identifiable {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let id: UUID
    let title: String
    let attendees: Array<String>
    let lengthInMinutes: Int
    let theme: Theme
    
    
    
    // MARK: - INITIALIZERS
    init(id: UUID = UUID.init(),
         title: String,
         attendees: Array<String>,
         lengthInMinutes: Int,
         theme: Theme) {
        
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
    
    
    
    // MARK: - COMPUTED PROPERTIES
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





extension DailyScrum {
    
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
    // MARK: - COMPUTED PROPERTIES
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}
