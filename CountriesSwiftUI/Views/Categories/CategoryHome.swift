/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view showing featured landmarks above a list of landmarks grouped by category.
*/

import SwiftUI

struct CategoryHome: View {
    // @Environment(ModelData.self) var modelData
       @Environment(\.injected.modelData) private var modelData: ModelData
    // @State private var showingProfile = false

    var body: some View {
        NavigationStack {
            List {
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .listRowInsets(EdgeInsets())

                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("探索")
            .navigationBarTitleDisplayMode(.inline)

            //                    .toolbar {
            //                        Button {
            //                            showingProfile.toggle()
            //                        } label: {
            //                            Label("User Profile", systemImage: "person.crop.circle")
            //                        }
            //                    }
            //                    .sheet(isPresented: $showingProfile) {
            //                        ProfileHost()
            //                            .environment(modelData)
            //                    }
            //                } detail: {
            //                    Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
