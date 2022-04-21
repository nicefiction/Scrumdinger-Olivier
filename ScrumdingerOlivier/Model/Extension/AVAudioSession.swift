// MARK: - LIBRARIES
import AVFoundation
import Foundation



extension AVAudioSession {
    
    /// `hasPermissionToRecord()` suspends the current task to call `requestRecordPermission(_:)`,
    /// which asks the user for permission before proceeding to access the microphone:
    func hasPermissionToRecord()
    async -> Bool {
        
        await withCheckedContinuation { continuation in
            requestRecordPermission { authorized in
                continuation.resume(returning: authorized)
            }
        }
    }
}
