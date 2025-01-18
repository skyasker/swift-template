//
//  TestView.swift
//  Landmarks
//
//  Created by xsun on 2024/12/14.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct TestView: View {
    @State var tabSelection: Int = 0
    @State var tabArray = ["Profile", "Settings"]

    var body: some View {
        NavigationStack {
            TabView(selection: $tabSelection) {
                ForEach(0..<tabArray.count, id: \.self) { indexValue in
                    NavigationLink(destination: DetailView()) {
                        VStack {
                            Text("\(tabArray[indexValue]) tab -- Click to jump next view")
                        }
                    }
                    .tabItem {
                        Image(systemName: "\(indexValue).circle.fill")
                        Text(tabArray[indexValue])
                    }
                    .tag(indexValue)
                }
            }
            .toolbar {
                if tabSelection == 0 {
                    Button {
                        print("Button clicked")
                    } label: {
                        Label("User Profile", systemImage: "1.circle.fill")
                    }
                } else {
                    Button {
                        print("Button clicked")
                    } label: {
                        Label("Settings", systemImage: "2.circle.fill")
                    }
                }
            }
            .navigationBarTitle(tabArray[tabSelection])
        }
    }
}

struct DetailView: View {
    var body: some View {
        Text("Detail View")
            .navigationBarTitle("NavigatedView")
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("helllo")
    }
}

#Preview {
    TestView()
}
