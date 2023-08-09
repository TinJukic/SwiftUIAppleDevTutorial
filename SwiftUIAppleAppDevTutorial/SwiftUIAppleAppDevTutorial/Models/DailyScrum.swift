//
//  DailyScrum.swift
//  SwiftUIAppleAppDevTutorial
//
//  Created by Tin Jukic on 09.08.2023..
//

import Foundation

struct DailyScrum {

    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var theme: Theme
}

extension  DailyScrum {

    static let sampleData: [DailyScrum] = [

        DailyScrum(
            title: "Design",
            attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
            lengthInMinutes: 10,
            theme: .yellow
        ),

        DailyScrum(
            title: "App Dev",
            attendees: ["Katie", "Gray", "Eden", "Luis", "Darla"],
            lengthInMinutes: 5,
            theme: .orange
        ),

        DailyScrum(
            title: "Web Dev",
            attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Chad", "Jenn", "Sarah"],
            lengthInMinutes: 5,
            theme: .poppy
        ),
    ]
}
