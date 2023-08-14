//
//  MeetingHeaderView.swift
//  SwiftUIAppleAppDevTutorial
//
//  Created by Tin Jukic on 14.08.2023..
//

import SwiftUI

struct MeetingHeaderView: View {

    // constants
    let secondsElapsed: Int
    let secondsRemainig: Int
    let theme: Theme

    private var totalSeconds: Int {

        secondsElapsed + secondsRemainig
    }  // private computed property

    private var progress: Double {

        guard totalSeconds > 0 else {

            return 1
        }

        return Double(secondsElapsed) / Double(totalSeconds)
    }  // private computed property

    private var minutesRemaining: Int {

        secondsRemainig / 60
    }  // private computed property

    var body: some View {

        VStack {

            ProgressView(value: progress)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))

            HStack {

                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
                }

                Spacer()

                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRemainig)", systemImage: "hourglass.bottomhalf.fill")
                        .labelStyle(.trailingIcon)
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaining) minutes")
        .padding([.top, .horizontal])
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {

    static var previews: some View {
        
        MeetingHeaderView(secondsElapsed: 60, secondsRemainig: 180, theme: .indigo)
            .previewLayout(.sizeThatFits)
    }
}
