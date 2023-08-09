//
//  CardView.swift
//  SwiftUIAppleAppDevTutorial
//
//  Created by Tin Jukic on 09.08.2023..
//

import SwiftUI

struct CardView: View {

    let scrum: DailyScrum

    var body: some View {

        VStack(alignment: .leading) {

            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)

            Spacer()

            HStack {

                let systemImageName: String = {

                    if scrum.attendees.count <= 1 {

                        return "person"
                    } else if scrum.attendees.count == 2 {

                        return "person.2"
                    } else {

                        return "person.3"
                    }
                }()

                Label("\(scrum.attendees.count)", systemImage: systemImageName)
                    .accessibilityLabel("\(scrum.attendees.count) attendees")

                Spacer()
                
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
                    .labelStyle(.trailingIcon)
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {

        let scrum = DailyScrum.sampleData[0]

        CardView(scrum: scrum)
            .background(scrum.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
