/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view showing a list of landmarks.
*/

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    @State private var filter = FilterCategory.all
    @State private var selectedLandmark: Landmark?
    @State private var showingProfile = false
    @State private var searchText = ""

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

    var index: Int? {
        modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    }

    var body: some View {
        @Bindable var modelData = modelData

        NavigationStack {
            List(selection: $selectedLandmark) {
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
//                        LandmarkDetail(landmark: landmark)
//                            .toolbar(.hidden, for: .tabBar)

                        MessageListView()

                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    .tag(landmark)
                }
                .onDelete { indexSet in
                    modelData.landmarks.remove(atOffsets: indexSet)
                }
                .onMove { indices, newOffset in
                    modelData.landmarks.move(fromOffsets: indices, toOffset: newOffset)
                }
            }
            .searchable(text: $searchText, prompt: "Search Landmarks")
            .animation(.default, value: filteredLandmarks)
            .listStyle(PlainListStyle())  // Add this line to make the list edges explicit
            .frame(minWidth: 300)
            .navigationTitle("会话")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {

                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showingProfile.toggle()
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
