//
//  HistoryView.swift
//  SwiftUIAppleAppDevTutorial
//
//  Created by Tin Jukic on 16.08.2023..
//

import SwiftUI

struct HistoryView: View {

    let history: History

    var body: some View {

        ScrollView {

            VStack(alignment: .leading) {

                Divider()
                    .padding(.bottom)

                Text("Attendees")
                    .font(.headline)

                Text(history.attendeeString)

                if let transcript = history.transcript {

                    Text("Transcript")
                        .font(.headline)
                        .padding(.top)

                    Text(transcript)
                }
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
    }
}

struct HistoryView_Previews: PreviewProvider {

    private static var history: History {

        History(attendees: [

            .init(name: "Jon"),
            .init(name: "Darla"),
            .init(name: "Luis"),
        ],
        transcript: "Darla, would you like to start today? Sure, yesterday I reviewed Luis' PR and met with the design team to finalize the UI...")
    }

    static var previews: some View {

        HistoryView(history: history)
    }
}

// MARK: - History Extension

extension History {

    var attendeeString: String {

        ListFormatter.localizedString(byJoining: attendees.map { $0.name })
    }
}
