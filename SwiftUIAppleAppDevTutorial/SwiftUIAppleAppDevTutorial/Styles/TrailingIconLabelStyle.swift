//
//  TrailingIconLabelStyle.swift
//  SwiftUIAppleAppDevTutorial
//
//  Created by Tin Jukic on 09.08.2023..
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {

    func makeBody(configuration: Configuration) -> some View {

        HStack {

            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self == TrailingIconLabelStyle {

    static var trailingIcon: Self {

        Self()
    }
}
