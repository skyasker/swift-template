/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A single row to be displayed in a list of landmarks.
*/

import SwiftUI

struct LandmarkRow: View {
    // var landmark: Landmark
    var landmark: DBModel.Channel

    var body: some View {
        HStack {
            Image(landmark.avatar)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)

            VStack(alignment: .leading) {
                Text(landmark.name)
                    // .bold()

                Spacer().frame(height: 10)

                #if !os(watchOS)
                    Text(landmark.text)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                #endif
            }

            Spacer()

            // if landmark.isFavorite {
            //     Image(systemName: "star.fill")
            //         .foregroundStyle(.yellow)
            // }
        }
        .padding(.vertical, 4)
    }
}

// #Preview {
//     let landmarks = ModelData().landmarks
//     return Group {
//         LandmarkRow(landmark: landmarks[0])
//         LandmarkRow(landmark: landmarks[1])
//     }
// }
