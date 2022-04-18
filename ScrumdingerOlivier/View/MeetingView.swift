// MARK: - LIBRARIES
import SwiftUI



struct MeetingView: View {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
    
        VStack {
            ProgressView.init(value: 5,
                              total: 15)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300",
                          systemImage: "hourglass.bottomhalf.filled")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600",
                          systemImage: "hourglass.tophalf.filled")
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("10 minutes")
            Circle()
                .strokeBorder(lineWidth: 24.0)
            HStack {
                Text("Speaker 1 of 3")
                Spacer()
                Button(action: {},
                       label: {
                    Image(systemName: "forward.fill")
                    
                })
                .accessibilityLabel("Next speaker")
            }
        }
        .padding()
    }
    /*
     VStack {
                 ProgressView(value: 5, total: 15)
                 HStack {
                     VStack {
                         Text("Seconds Elapsed")
                         Label("300", systemImage: "hourglass.bottomhalf.fill")
                     }
                     VStack {
                         Text("Seconds Remaining")
                         Label("600", systemImage: "hourglass.tophalf.fill")
                     }
                 }
             }
     */
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS
struct MeetingView_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        MeetingView()
    }
}
