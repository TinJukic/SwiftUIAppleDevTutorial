//
//  DetailView.swift
//  SwiftUIAppleAppDevTutorial
//
//  Created by Tin Jukic on 11.08.2023..
//

import SwiftUI

struct DetailView: View {

    // variable bindings
    @Binding var scrum: DailyScrum

    // state properties
    @State private var isPresentingEditView: Bool = false
    @State private var editingScrum: DailyScrum = .emptyScrum

    var body: some View {

        List {

            Section(header: Text("Meeting Info")) {

                NavigationLink(destination: MeetingView(scrum: $scrum)) {

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

            Section {

                if scrum.history.isEmpty {

                    Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
                }

                ForEach(scrum.history) { history in

                    HStack {

                        Image(systemName: "calendar")

                        Text(history.date, style: .date)
                    }
                }
            } header: {

                Text("History")
            }
        }
        .navigationTitle(scrum.title)
        .toolbar {

            Button("Edit") {

                isPresentingEditView = true
                editingScrum = scrum
            }
        }
        .sheet(isPresented: $isPresentingEditView) {

            NavigationStack {

                DetailEditView(scrum: $editingScrum)
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
                                scrum = editingScrum
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
            
            DetailView(scrum: .constant(.sampleData[0]))
        }
    }
}
