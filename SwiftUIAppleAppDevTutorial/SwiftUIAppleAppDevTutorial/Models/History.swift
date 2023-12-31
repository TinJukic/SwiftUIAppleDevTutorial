//
//  History.swift
//  SwiftUIAppleAppDevTutorial
//
//  Created by Tin Jukic on 14.08.2023..
//

import Foundation

struct History: Identifiable, Codable {

    let id: UUID
    let date: Date
    var attendees: [DailyScrum.Attendee]
    var transcript: String?

    init(
        id: UUID = UUID(),
        date: Date = Date(),
        attendees: [DailyScrum.Attendee],
        transcript: String? = nil
    ) {

        self.id = UUID()
        self.date = date
        self.attendees = attendees
        self.transcript = transcript
    }
}
