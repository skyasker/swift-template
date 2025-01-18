/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view showing featured landmarks above a list of all of the landmarks.
*/

import SwiftUI

struct ContentView: View {
    // @Environment(ModelData.self) var modelData
    // @State private var selection: Tab = .list
    // @State private var listBadge: Int = 4
    // @State private var featuredBadge: Int = 2
    // @State private var showingProfile = false

    // enum Tab {
    //     case list
    //     case featured
    // }

    //    @State private var visibility: TabBarVisibility = .visible
    //
    //    private enum Tab: Int, Tabbable {
    //        case first = 0
    //        case second
    //
    //        var icon: String {
    //            switch self {
    //                case .first: return "house"
    //                case .second: return "magnifyingglass"
    //            }
    //        }
    //
    //        var title: String {
    //            switch self {
    //                case .first: return "First"
    //                case .second: return "Second"
    //            }
    //        }
    //    }

    var body: some View {

        //            TabView {
        LandmarkList()
        // .tabItem {
        //     Label("List", systemImage: "list.bullet")
        // }
        // .tag(Tab.list)
        // .badge(listBadge)

        //            }

        //        TabBar(selection: $selection, visibility: $visibility) {
        //            LandmarkList()
        //               .tabItem(for: Tab.first)
        //
        //            CategoryHome()
        //               .tabItem(for: Tab.second)
        //        }

        //        .tabBar(style: CustomTabBarStyle())
        //        .tabItem(style: CustomTabItemStyle())

        // TestView()

        //        NavigationStack {
        //            TabView(selection: $selection) {
        //                LandmarkList()
        //                    .tabItem {
        //                        Label("List", systemImage: "list.bullet")
        //                    }
        //                    .tag(Tab.list)
        //                    .badge(listBadge)
        //
        //                CategoryHome()
        //                    .tabItem {
        //                        Label("Featured", systemImage: "star")
        //                    }
        //                    .tag(Tab.featured)
        //                    .badge(featuredBadge)
        //            }
        //            .toolbar {
        //                if selection == .list {
        //                    ToolbarItem(placement: .navigationBarLeading) {
        //                        Button(action: {
        //                            showingProfile.toggle()
        //                        }) {
        //                            Label("Profile", systemImage: "person.crop.circle")
        //                        }
        //                    }
        //                    ToolbarItem(placement: .navigationBarTrailing) {
        //                        Button(action: {
        //                            print("Add tapped")
        //                        }) {
        //                            Image(systemName: "plus")
        //                        }
        //                    }
        //                } else {
        //                    ToolbarItem(placement: .navigationBarTrailing) {
        //                        Button(action: {
        //                            print("Edit tapped")
        //                        }) {
        //                            Text("Edit")
        //                        }
        //                    }
        //                }
        //            }
        //            .sheet(isPresented: $showingProfile) {
        //                ProfileHost()
        //                    .environment(modelData)
        //            }
        //            .onChange(of: selection) { oldState, newState in
        //                switch newState {
        //                case .list:
        //                    listBadge = 0
        //                case .featured:
        //                    featuredBadge = 0
        //                }
        //            }
        //        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
