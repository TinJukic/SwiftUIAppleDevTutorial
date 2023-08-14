//
//  ScrumsView.swift
//  SwiftUIAppleAppDevTutorial
//
//  Created by Tin Jukic on 09.08.2023..
//

import SwiftUI

struct ScrumsView: View {

    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewScrumView: Bool = false

    let saveAction: () -> Void

    var body: some View {

        NavigationStack {

            List($scrums) { $scrum in

                NavigationLink(destination: DetailView(scrum: $scrum)) {

                    CardView(scrum: scrum)
                        .listRowBackground(scrum.theme.mainColor)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {

                Button(action: {

                    isPresentingNewScrumView = true
                }) {

                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
            .sheet(isPresented: $isPresentingNewScrumView) {

                NewScrumSheet(
                    scrums: $scrums,
                    isPresentingNewScrumView: $isPresentingNewScrumView
                )
            }
            .onChange(of: scenePhase) { phase in

                if phase == .inactive {

                    saveAction()
                }
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {

    static var previews: some View {

        ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
    }
}
