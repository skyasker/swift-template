/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view showing a list of landmarks.
*/

import SwiftData
import SwiftUI

struct LandmarkList: View {
    // @Environment(ModelData.self) var modelData
    @Environment(\.injected.modelData) private var modelData: ModelData
    @State private var showFavoritesOnly = false
    @State private var filter = FilterCategory.all
    @State private var selectedLandmark: Landmark?
    @State private var showingProfile = false
    @State private var searchText = ""
    @State private var channels: [DBModel.Channel] = []
    @State private var selectedChannel: DBModel.Channel?
    @Environment(\.injected) private var injected: DIContainer

    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"

        var id: FilterCategory { self }
    }

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
                && (filter == .all || filter.rawValue == landmark.category.rawValue)
                && (searchText.isEmpty || landmark.name.contains(searchText)
                    || landmark.park.contains(searchText))
        }
    }

    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }

    // var index: Int? {
    //     modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    // }

    var body: some View {
        @Bindable var modelData = modelData

        NavigationStack {
            List(selection: $selectedChannel) {
                ForEach(channels) { landmark in
                    NavigationLink {
//                        LandmarkDetail(landmark: landmark)
//                            .toolbar(.hidden, for: .tabBar)

                        MessageListView()

                    } label: {
                        LandmarkRow(landmark: landmark)
                        // Text(landmark.name)
                    }
                    .tag(landmark)
                }
                // .onDelete { indexSet in
                //     modelData.landmarks.remove(atOffsets: indexSet)
                // }
                // .onMove { indices, newOffset in
                //     modelData.landmarks.move(fromOffsets: indices, toOffset: newOffset)
                // }
            }
            .searchable(text: $searchText, prompt: "搜索")
            .animation(.default, value: filteredLandmarks)
            .listStyle(PlainListStyle())  // Add this line to make the list edges explicit
            .frame(minWidth: 300)
            .navigationTitle("会话")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {

                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showingProfile.toggle()
                        // Task {
                        //     do {
                        //         try await injected.interactors.message.mockChannels()
                        //     } catch {
                        //         print("Failed to mock channels: \(error)")
                        //     }
                        // }
                    } label: {
                        Label("User Profile", systemImage: "person.crop.circle")
                    }

                    //                                          Menu {
                    //                                              Picker("Category", selection: $filter) {
                    //                                                  ForEach(FilterCategory.allCases) { category in
                    //                                                      Text(category.rawValue).tag(category)
                    //                                                  }
                    //                                              }
                    //                                              .pickerStyle(.inline)
                    //
                    //                                              Toggle(isOn: $showFavoritesOnly) {
                    //                                                  Label("Favorites only", systemImage: "star.fill")
                    //                                              }
                    //                                          } label: {
                    //                                              Label("Filter", systemImage: "slider.horizontal.3")
                    //                                          }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        CategoryHome()
                    } label: {
                        Label("Favorites only", systemImage: "star.fill")
                    }
                }

            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environment(modelData)
            }
        }
        .query(
            searchText: searchText, results: $channels,
            { search in
                Query(
                    filter: #Predicate<DBModel.Channel> { channel in
                        if search.isEmpty {
                            return true
                        } else {
                            return channel.name.localizedStandardContains(search)
                        }
                    }, sort: \DBModel.Channel.channelID)
            }
        )
        //        } detail: {
        //            Text("Select a Landmark")
        //        }
        //        .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
