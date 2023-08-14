//
//  Theme.swift
//  SwiftUIAppleAppDevTutorial
//
//  Created by Tin Jukic on 09.08.2023..
//

import SwiftUI

/// Color theme for the app.
enum Theme: String, CaseIterable, Identifiable, Codable {

    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow

    /// Provides high-contrast complement to the theme's main color,
    /// ensuring views remain accessible.
    var accentColor: Color {

        switch self {

        case .bubblegum,
             .buttercup,
             .lavender,
             .orange,
             .periwinkle,
             .poppy,
             .seafoam,
             .sky,
             .tan,
             .teal,
             .yellow:
            return .black

        case .indigo,
             .magenta,
             .navy,
             .oxblood,
             .purple:
            return .white
        }
    }

    /// Initializes a color from the asset catalog.
    var mainColor: Color {

        Color(rawValue)
    }

    /// Capitalized color name, unique for every color
    var name: String {

        rawValue.capitalized
    }

    /// ID of the selected color
    var id: String {

        name
    }
}
