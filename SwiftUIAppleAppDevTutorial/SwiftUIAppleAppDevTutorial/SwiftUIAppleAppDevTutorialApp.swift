//
//  SwiftUIAppleAppDevTutorialApp.swift
//  SwiftUIAppleAppDevTutorial
//
//  Created by Tin Jukic on 09.08.2023..
//

import SwiftUI

@main
struct SwiftUIAppleAppDevTutorialApp: App {

    @StateObject private var store: ScrumStore = .init()
    @State private var errorWrapper: ErrorWrapper?

    var body: some Scene {

        WindowGroup {
            
            ScrumsView(scrums: $store.scrums) {  // passing a binding to scrums

                Task {

                    do {

                        try await store.save(scrums: store.scrums)
                    } catch {

                        errorWrapper = .init(
                            error: error,
                            guidance: "Try again later."
                        )
                    }
                }
            }
            .task {

                do {

                    try await store.load()
                } catch {

                    errorWrapper = .init(
                        error: error,
                        guidance: "Scrumdinger will load sample data and continue."
                    )
                }
            }
            .sheet(item: $errorWrapper) {

                store.scrums = DailyScrum.sampleData
            } content: { wrapper in

                ErrorView(errorWrapper: wrapper)
            }
        }
    }
}
