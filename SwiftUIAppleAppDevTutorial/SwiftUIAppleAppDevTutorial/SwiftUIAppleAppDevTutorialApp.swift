//
//  SwiftUIAppleAppDevTutorialApp.swift
//  SwiftUIAppleAppDevTutorial
//
//  Created by Tin Jukic on 09.08.2023..
//

import SwiftUI

@main
struct SwiftUIAppleAppDevTutorialApp: App {

    @State private var scrums: [DailyScrum] = DailyScrum.sampleData

    var body: some Scene {

        WindowGroup {
            
            ScrumsView(scrums: $scrums)  // passing a binding to scrums
        }
    }
}
