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

    var body: some Scene {

        WindowGroup {
            
            ScrumsView(scrums: $store.scrums) {  // passing a binding to scrums

                Task {

                    do {

                        try await store.save(scrums: store.scrums)
                    } catch {

                        fatalError(error.localizedDescription)
                    }
                }
            }
            .task {

                do {

                    try await store.load()
                } catch {

                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}
