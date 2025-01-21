/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view that summarizes a profile.
*/

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    @Environment(\.injected) private var injected: DIContainer

    var body: some View {
        List {
            HStack(alignment: .center) {
                Image("twinlake")
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
                    Label("通知", systemImage: "bell.circle.fill")
                    Spacer()
                    Text(profile.prefersNotifications ? "On" : "Off")
                        .foregroundStyle(.secondary)
                }

                HStack {
                    Label("状态", systemImage: "camera.circle.fill")
                    Spacer()
                    Text(profile.seasonalPhoto.rawValue)
                        .foregroundStyle(.secondary)
                }

                HStack {
                    Label("注册时间", systemImage: "calendar.circle.fill")
                    Spacer()
                    Text(profile.goalDate, style: .date)
                        .foregroundStyle(.secondary)
                }
            }

            // Section {
                Button(action: {
                    injected.appState[\.user.isLoggedIn] = false
                    injected.interactors.message.disconnect()
                    UserDefaults.standard.set(false, forKey: "isLoggedIn")
                    UserDefaults.standard.removeObject(forKey: "userId")
                    // UserDefaults.standard.set(false, forKey: "isPreviewed")
                }) {
                    Text("登出")
                        // .font(.headline)
                        .bold()
                        .foregroundColor(.red)
                        // .padding()
                        .frame(maxWidth: .infinity)
                        // .background(Color.red)
                        // .cornerRadius(10)
                }
            // }

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
