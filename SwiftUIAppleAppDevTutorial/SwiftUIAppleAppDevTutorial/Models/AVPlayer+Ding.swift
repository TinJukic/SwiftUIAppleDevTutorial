//
//  AVPlayer+Ding.swift
//  SwiftUIAppleAppDevTutorial
//
//  Created by Tin Jukic on 14.08.2023..
//

import Foundation
import AVFoundation

extension AVPlayer {

    static var sharedDingPlayer: AVPlayer {

        guard let url = Bundle.main.url(forResource: "ding", withExtension: "wav") else {

            fatalError("Failed to find sound file.")
        }

        return .init(url: url)
    }
}
