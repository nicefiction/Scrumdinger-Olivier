// MARK: - LIBRARIES
import Foundation
import Speech



extension SFSpeechRecognizer {
    
    /// `hasAuthorizationToRecognize() `suspends the current task to call `requestAuthorization(_:)`,
    /// which asks the user for permission before proceeding with speech recognition.
    static func hasAuthorizationToRecognize()
    async -> Bool {
        
        await withCheckedContinuation { continuation in
            requestAuthorization { status in
                continuation.resume(returning: status == .authorized)
            }
        }
    }
}
