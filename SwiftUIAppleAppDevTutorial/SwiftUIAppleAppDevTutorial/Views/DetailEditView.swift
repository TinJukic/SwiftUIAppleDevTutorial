//
//  DetailEditView.swift
//  SwiftUIAppleAppDevTutorial
//
//  Created by Tin Jukic on 11.08.2023..
//

import SwiftUI

struct DetailEditView: View {

    // properties
    @State private var scrum: DailyScrum = DailyScrum.emptyScrum
    @State private var newAttendeeName: String = ""

    var body: some View {

        Form {

            Section {

                TextField("Title", text: $scrum.title)

                HStack {

                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {

                        Text("Lenght")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")

                    Spacer()

                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }
            } header: {

                Text("Meeting Info")
            }

            Section {

                ForEach(scrum.attendees) { // attendee in -> $0.name == attendee.name

                    Text($0.name)
                }
                .onDelete { indices in

                    scrum.attendees.remove(atOffsets: indices)  // OR: $0 without `indices in`
                }

                HStack {

                    TextField("New Attendee", text: $newAttendeeName)

                    Button(action: {

                        withAnimation {

                            scrum.attendees.append(DailyScrum.Attendee(name: newAttendeeName))

                            newAttendeeName = ""
                        }
                    }) {

                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendees")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
            } header: {

                Text("Attendees")
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {

    static var previews: some View {

        DetailEditView()
    }
}
