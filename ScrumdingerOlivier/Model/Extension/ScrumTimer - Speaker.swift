//
//  ScrumTimer - Speaker.swift
//  ScrumdingerOlivier
//
//  Created by Olivier Van hamme on 21/04/2022.
//

import Foundation


extension ScrumTimer {
    
    // MARK: - NESTED TYPES
    /// A struct to keep track of meeting attendees during a meeting.
    struct Speaker: Identifiable {
        
        // MARK: - NESTED TYPES
        // MARK: - STATIC PROPERTIES
        // MARK: - PROPERTY WRAPPERS
        // MARK: - PROPERTIES
        /// The attendee name:
        let name: String
        /// True if the attendee has completed their turn to speak:
        var isCompleted: Bool
        /// Id for Identifiable conformance:
        let id = UUID()
        
        
        
        // MARK: - COMPUTED PROPERTIES
        // MARK: - STATIC METHODS
        // MARK: - METHODS
        // MARK: - HELPER METHODS
    }
}
