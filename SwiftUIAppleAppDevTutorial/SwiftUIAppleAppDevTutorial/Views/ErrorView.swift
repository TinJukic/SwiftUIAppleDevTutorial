//
//  ErrorView.swift
//  SwiftUIAppleAppDevTutorial
//
//  Created by Tin Jukic on 14.08.2023..
//

import SwiftUI

struct ErrorView: View {

    @Environment(\.dismiss) private var dismiss

    let errorWrapper: ErrorWrapper

    var body: some View {

        NavigationStack {

            VStack {

                Text("An error has occured!")
                    .font(.title)
                    .padding(.bottom)

                Text(errorWrapper.error.localizedDescription)
                    .font(.headline)

                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding(.top)

                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(16.0)
            .toolbar {

                ToolbarItem(placement: .navigationBarTrailing) {

                    Button("Dismiss") {

                        dismiss()
                    }
                }
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {

    enum SampleError: Error {

        case errorRequired
    }

    static var wrapper: ErrorWrapper {

        .init(
            error: SampleError.errorRequired,
            guidance: "You can safely ignore this error. :)"
        )
    }

    static var previews: some View {

        ErrorView(errorWrapper: wrapper)
    }
}
