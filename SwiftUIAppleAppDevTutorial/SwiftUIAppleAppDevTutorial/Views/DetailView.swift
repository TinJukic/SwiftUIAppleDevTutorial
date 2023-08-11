//
//  DetailView.swift
//  SwiftUIAppleAppDevTutorial
//
//  Created by Tin Jukic on 11.08.2023..
//

import SwiftUI

struct DetailView: View {

    // state properties
    @State private var isPresentingEditView: Bool = false

    let scrum: DailyScrum

    var body: some View {

        List {

            Section(header: Text("Meeting Info")) {

                NavigationLink(destination: MeetingView()) {

                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }

                HStack {

                    Label("Length", systemImage: "clock")

                    Spacer()

                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)

                HStack {

                    Label("Themes", systemImage: "paintpalette")

                    Spacer()

                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
            }

            Section(header: Text("Attendees")) {

                ForEach(scrum.attendees) { attendee in

                    Label(attendee.name, systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar {

            Button("Edit") {

                isPresentingEditView = true
            }
        }
        .sheet(isPresented: $isPresentingEditView) {

            NavigationStack {

                DetailEditView()
                    .navigationTitle(scrum.title)
                    .toolbar {

                        ToolbarItem(placement: .cancellationAction) {

                            Button("Cancel") {

                                isPresentingEditView = false
                            }
                        }

                        ToolbarItem(placement: .confirmationAction) {

                            Button("Done") {

                                isPresentingEditView = false
                            }
                        }
                    }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {

    static var previews: some View {

        NavigationStack {
            
            DetailView(scrum: DailyScrum.sampleData[0])
        }
    }
}
