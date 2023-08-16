//
//  MeetingView.swift
//  SwiftUIAppleAppDevTutorial
//
//  Created by Tin Jukic on 09.08.2023..
//

import SwiftUI
import AVFoundation

struct MeetingView: View {

    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer: ScrumTimer = ScrumTimer()

    private var player: AVPlayer {

        .sharedDingPlayer
    }

    var body: some View {

        ZStack {

            RoundedRectangle(cornerRadius: 16)
                .fill(scrum.theme.mainColor)

            VStack {

                MeetingHeaderView(
                    secondsElapsed: scrumTimer.secondsElapsed,
                    secondsRemainig: scrumTimer.secondsRemaining,
                    theme: scrum.theme
                )

                MeetingTimerView(speakers: scrumTimer.speakers, theme: scrum.theme)

                MeetingFooterView(
                    speakers: scrumTimer.speakers,
                    skipAction: scrumTimer.skipSpeaker
                )
            }
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .onAppear {

            startScrum()
        }
        .onDisappear {

            endScrum()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Helper Methods

extension MeetingView {

    private func startScrum() {

        scrumTimer.reset(
            lengthInMinutes: scrum.lengthInMinutes,
            attendees: scrum.attendees
        )

        scrumTimer.speakerChangedAction = {

            player.seek(to: .zero)
            player.play()
        }

        scrumTimer.startScrum()
    }

    private func endScrum() {

        scrumTimer.stopScrum()

        scrum.history.insert(History(attendees: scrum.attendees), at: 0)
    }
}

struct MeetingView_Previews: PreviewProvider {

    static var previews: some View {

        MeetingView(scrum: .constant(.emptyScrum))
    }
}
