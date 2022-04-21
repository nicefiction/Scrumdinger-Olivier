//// MARK: - LIBRARIES

import AVFoundation
import SwiftUI



struct MeetingView: View {

    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @Binding var dailyScrum: DailyScrum
    /// Wrapping a property as a `@StateObject `
    /// means the view owns the source of truth for the object.
    /// `@StateObject `ties the `ScrumTimer`,
    /// which is an `ObservableObject`,
    /// to the `MeetingView` life cycle:
    @StateObject var scrumTimer = ScrumTimer.init()
    @StateObject var speechRecognizer = SpeechRecognizer.init()
    @State private var isRecording: Bool = false



    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    private var player: AVPlayer {
        return AVPlayer.sharedDingPlayer
    }
    
    
    var body: some View {

        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(dailyScrum.theme.mainColor)
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed,
                                  secondsRemaining: scrumTimer.secondsRemaining,
                                  theme: dailyScrum.theme)
                MeetingTimerView(speakers: scrumTimer.speakers,
                                 isRecording: isRecording,
                                 theme: dailyScrum.theme)
                MeetingFooterView(speakers: scrumTimer.speakers,
                                  skipAction: scrumTimer.skipSpeaker)
            }
        }
        .padding()
        .foregroundColor(dailyScrum.theme.accentColor)
        .onAppear {
            scrumTimer.reset(lengthInMinutes: dailyScrum.lengthInMinutes,
                             attendees: dailyScrum.attendees)
            scrumTimer.speakerChangedAction = {
                /// Seeking to time `.zero`
                /// ensures the audio file always plays from the beginning:
                player.seek(to: .zero)
                player.play()
            }
            speechRecognizer.reset()
            speechRecognizer.transcribe()
            isRecording = true
            scrumTimer.startScrum()
        }
        .onDisappear {
            scrumTimer.stopScrum()
            speechRecognizer.stopTranscribing()
            isRecording = false
            let newHistory = History.init(attendees: dailyScrum.attendees,
                                          lengthInMinutes: dailyScrum.timer.secondsElapsed / 60,
                                          transcript: speechRecognizer.transcript)
            dailyScrum.history.insert(newHistory,
                                      at: 0)
        }
        .navigationBarTitleDisplayMode(.inline)
    }



    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
    // MARK: - INITIALIZERS
}





// MARK: - PREVIEWS
struct MeetingView_Previews: PreviewProvider {

    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {

        MeetingView(dailyScrum: .constant(DailyScrum.sampleData[0]))
    }
}
