/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view that hosts the profile viewer and editor.
*/

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    // @Environment(ModelData.self) var modelData
    // @Environment(\.injected.modelData) private var modelData: ModelData
    @State private var draftProfile = Profile.default
    @State private var profile = Profile.default

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            .padding()

            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = profile
                    }
                    .onDisappear {
                        profile = draftProfile
                    }
            }
        }
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData())
}
