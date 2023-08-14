//
//  ThemeView.swift
//  SwiftUIAppleAppDevTutorial
//
//  Created by Tin Jukic on 14.08.2023..
//

import SwiftUI

struct ThemeView: View {

    let theme: Theme

    var body: some View {

        Text(theme.name)
            .padding(4)
            .frame(maxWidth: .infinity)
            .foregroundColor(theme.accentColor)
            .background(theme.mainColor)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

struct ThemeView_Previews: PreviewProvider {

    static var previews: some View {

        ThemeView(theme: .indigo)
    }
}
