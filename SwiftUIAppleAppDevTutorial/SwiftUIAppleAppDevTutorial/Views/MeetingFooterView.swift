//
//  MeetingFooterView.swift
//  SwiftUIAppleAppDevTutorial
//
//  Created by Tin Jukic on 14.08.2023..
//

import SwiftUI

struct MeetingFooterView: View {

    let speakers: [ScrumTimer.Speaker]
    var skipAction: () -> Void

    private var speakerNumber: Int? {

        guard let index = speakers.firstIndex(where: {

            !$0.isCompleted
        }) else {

            return nil
        }

        return index + 1
    }  // private computed property

    private var isLastSpeaker: Bool {

        speakers.dropLast().allSatisfy {

            $0.isCompleted
        }
    }  // private computed property

    private var speakerText: String {

        guard let speakerNumber else {

            return "No more speakers"
        }

        return "Speaker \(speakerNumber) of \(speakers.count)"
    }  // private computed property

    var body: some View {

        VStack {

            HStack {

                if isLastSpeaker {

                    Text("Last speaker")
                } else {

                    Text(speakerText)

                    Spacer()

                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
}

struct MeetingFooterView_Previews: PreviewProvider {

    static var previews: some View {
        
        MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {})
            .previewLayout(.sizeThatFits)
    }
}
