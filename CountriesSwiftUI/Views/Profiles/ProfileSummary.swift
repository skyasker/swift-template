/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view that summarizes a profile.
*/

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile

    var body: some View {
        List {
            HStack(alignment: .center) {
                Image(systemName: "person.crop.circle.fill") 
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    // .overlay {
                    //     Circle().stroke(.white, lineWidth: 2)
                    // }
                    // .shadow(radius: 7)
                    // .padding(.bottom)
                
                Text(profile.username)
                    .bold()
                    // .font(.title)
            }
            .listRowInsets(EdgeInsets())
            .padding()
            
            Section {
                HStack {
                    Label("Notifications", systemImage: "bell.circle.fill")
                    Spacer()
                    Text(profile.prefersNotifications ? "On" : "Off")
                        .foregroundStyle(.secondary)
                }
                
                HStack {
                    Label("Seasonal Photos", systemImage: "camera.circle.fill")
                    Spacer()
                    Text(profile.seasonalPhoto.rawValue)
                        .foregroundStyle(.secondary)
                }
                
                HStack {
                    Label("Goal Date", systemImage: "calendar.circle.fill")
                    Spacer()
                    Text(profile.goalDate, style: .date)
                        .foregroundStyle(.secondary)
                }
            }

            // Section("Completed Badges") {
            //     ScrollView(.horizontal) {
            //         HStack {
            //             HikeBadge(name: "First Hike")
            //             HikeBadge(name: "Earth Day")
            //                 .hueRotation(Angle(degrees: 90))
            //             HikeBadge(name: "Tenth Hike")
            //                 .grayscale(0.5)
            //                 .hueRotation(Angle(degrees: 45))
            //         }
            //         .padding(.bottom)
            //     }
            // }
        }
    }
}

#Preview {
    ProfileSummary(profile: Profile.default)
        .environment(ModelData())
}
