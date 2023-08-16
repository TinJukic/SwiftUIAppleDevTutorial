//
//  SpeakerArc.swift
//  SwiftUIAppleAppDevTutorial
//
//  Created by Tin Jukic on 16.08.2023..
//

import SwiftUI

extension Double {

    fileprivate static let fullCircle = 360.0
}

struct SpeakerArc: Shape {

    let speakerIndex: Int
    let totalSpeakers: Int

    private var degreesPerSpeaker: Double {

        .fullCircle / Double(totalSpeakers)
    }

    private var startAngle: Angle {

        .init(degrees: degreesPerSpeaker * Double(speakerIndex) + 1.0)
    }

    private var endAngle: Angle {

        .init(degrees: startAngle.degrees + degreesPerSpeaker - 1.0)
    }

    func path(in rect: CGRect) -> Path {

        let diameter = min(rect.size.width, rect.size.height) - 24.0
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.midX, y: rect.midY)

        return Path { path in

            path.addArc(
                center: center,
                radius: radius,
                startAngle: startAngle,
                endAngle: endAngle,
                clockwise: true
            )
        }
    }
}
