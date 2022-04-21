// MARK: - LIBRARIES
import Foundation

/// Keeps time for a daily scrum meeting.
/// Keep track of the total meeting time,
/// the time for each speaker,
/// and the name of the current speaker.
class ScrumTimer: ObservableObject {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    /// The name of the meeting attendee who is speaking.
    @Published var activeSpeaker = ""
    /// The number of seconds since the beginning of the meeting.
    @Published var secondsElapsed = 0
    /// The number of seconds until all attendees have had a turn to speak.
    @Published var secondsRemaining = 0
    /// All meeting attendees, listed in the order they will speak.

    
    
    // MARK: - PROPERTIES
    private(set) var speakers = Array<Speaker>.init()
    /// The scrum meeting length.
    private(set) var lengthInMinutes: Int
    /// A closure that is executed when a new attendee begins speaking.
    var speakerChangedAction: (() -> Void)?
    private var timer: Timer?
    private var timerStopped = false
    private var secondsElapsedForSpeaker: Int = 0
    private var speakerIndex: Int = 0
    private var startDate: Date?
    
    
    
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    private var frequency: TimeInterval { 1.0 / 60.0 }
    private var lengthInSeconds: Int { lengthInMinutes * 60 }
    private var secondsPerSpeaker: Int {
        (lengthInMinutes * 60) / speakers.count
    }
    private var speakerText: String {
        return "Speaker \(speakerIndex + 1): " + speakers[speakerIndex].name
    }
    
    
    
    // MARK: - INITIALIZERS
    /**
     Initialize a new timer. Initializing a time with no arguments creates a ScrumTimer with no attendees and zero length.
     Use `startScrum()` to start the timer.
     
     - Parameters:
        - lengthInMinutes: The meeting length.
        -  attendees: A list of attendees for the meeting.
     */
    init(lengthInMinutes: Int = 0,
         attendees: Array<DailyScrum.Attendee> = Array<DailyScrum.Attendee>.init()) {
        
        self.lengthInMinutes = lengthInMinutes
        self.speakers        = attendees.speakers
        secondsRemaining     = lengthInSeconds
        activeSpeaker        = speakerText
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    /// Start the timer.
    func startScrum() {
        changeToSpeaker(at: 0)
    }
    
    
    /// Stop the timer.
    func stopScrum() {
        timer?.invalidate()
        timer = nil
        timerStopped = true
    }
    
    
    /// Advance the timer to the next speaker.
    func skipSpeaker() {
        changeToSpeaker(at: speakerIndex + 1)
    }
    
    
    private func changeToSpeaker(at index: Int)
    -> Void {
        
        if index > 0 {
            let previousSpeakerIndex = index - 1
            speakers[previousSpeakerIndex].isCompleted = true
        }
        secondsElapsedForSpeaker = 0
        guard index < speakers.count else { return }
        speakerIndex = index
        activeSpeaker = speakerText
        
        secondsElapsed = index * secondsPerSpeaker
        secondsRemaining = lengthInSeconds - secondsElapsed
        startDate = Date()
        timer = Timer.scheduledTimer(withTimeInterval: frequency,
                                     repeats: true) { [weak self] timer in
            if let self = self, let startDate = self.startDate {
                let secondsElapsed = Date().timeIntervalSince1970 - startDate.timeIntervalSince1970
                self.update(secondsElapsed: Int(secondsElapsed))
            }
        }
    }
    
    
    private func update(secondsElapsed: Int)
    -> Void {
        
        secondsElapsedForSpeaker = secondsElapsed
        self.secondsElapsed = secondsPerSpeaker * speakerIndex + secondsElapsedForSpeaker
        guard secondsElapsed <= secondsPerSpeaker else {
            return
        }
        secondsRemaining = max(lengthInSeconds - self.secondsElapsed, 0)
        
        guard !timerStopped else { return }
        
        if secondsElapsedForSpeaker >= secondsPerSpeaker {
            changeToSpeaker(at: speakerIndex + 1)
            speakerChangedAction?()
        }
    }
    
    /**
     Reset the timer with a new meeting length and new attendees.
     
     - Parameters:
     - lengthInMinutes: The meeting length.
     - attendees: The name of each attendee.
     */
    func reset(lengthInMinutes: Int,
               attendees: [DailyScrum.Attendee])
    -> Void {
        
        self.lengthInMinutes = lengthInMinutes
        self.speakers = attendees.speakers
        secondsRemaining = lengthInSeconds
        activeSpeaker = speakerText
    }
    
    
    
    // MARK: - HELPER METHODS
}
