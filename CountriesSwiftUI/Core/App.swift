//
//  CountriesApp.swift
//  CountriesSwiftUI
//
//  Created by Alexey on 7/11/24.
//  Copyright © 2024 Alexey Naumov. All rights reserved.
//

import EnvironmentOverrides
import SwiftUI

@main
struct MainApp: App {

    //    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            //            appDelegate.rootView
            ContentView()
                .environment(modelData)
        }
    }
}
