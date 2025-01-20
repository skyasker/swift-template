//
//  AppEnvironment.swift
//  CountriesSwiftUI
//
//  Created by Alexey on 7/11/24.
//  Copyright © 2024 Alexey Naumov. All rights reserved.
//

import Combine
import SwiftData
import SwiftUI
import UIKit

@MainActor
struct AppEnvironment {
    let isRunningTests: Bool
    let diContainer: DIContainer
    let modelContainer: ModelContainer
    let systemEventsHandler: SystemEventsHandler
}

extension AppEnvironment {

    static func bootstrap() -> AppEnvironment {
        let appState = Store<AppState>(AppState())
        /*
         To see the deep linking in action:

         1. Launch the app in iOS 13.4 simulator (or newer)
         2. Subscribe on Push Notifications with "Allow Push" button
         3. Minimize the app
         4. Drag & drop "push_with_deeplink.apns" into the Simulator window
         5. Tap on the push notification

         Alternatively, just copy the code below before the "return" and launch:

            DispatchQueue.main.async {
                deepLinksHandler.open(deepLink: .showCountryFlag(alpha3Code: "AFG"))
            }
        */
        let session = configuredURLSession()
        let webRepositories = configuredWebRepositories(session: session)
        let modelContainer = configuredModelContainer()
        let dbRepositories = configuredDBRepositories(modelContainer: modelContainer)
        let interactors = configuredInteractors(
            appState: appState, webRepositories: webRepositories, dbRepositories: dbRepositories)
        let diContainer = DIContainer(appState: appState, interactors: interactors)
        let deepLinksHandler = RealDeepLinksHandler(container: diContainer)
        let pushNotificationsHandler = RealPushNotificationsHandler(
            deepLinksHandler: deepLinksHandler)
        let systemEventsHandler = RealSystemEventsHandler(
            container: diContainer,
            deepLinksHandler: deepLinksHandler,
            pushNotificationsHandler: pushNotificationsHandler,
            pushTokenWebRepository: webRepositories.pushToken)
        return AppEnvironment(
            isRunningTests: ProcessInfo.processInfo.isRunningTests,
            diContainer: diContainer,
            modelContainer: modelContainer,
            systemEventsHandler: systemEventsHandler)
    }

    private static func configuredURLSession() -> URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 120
        configuration.waitsForConnectivity = true
        configuration.httpMaximumConnectionsPerHost = 5
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        configuration.urlCache = .shared
        return URLSession(configuration: configuration)
    }

    private static func configuredWebRepositories(session: URLSession)
        -> DIContainer.WebRepositories
    {
        let images = RealImagesWebRepository(session: session)
        let countries = RealCountriesWebRepository(session: session)
        let pushToken = RealPushTokenWebRepository(session: session)
        let core = RealCoreWebRepository(session: session)
        return .init(
            images: images,
            countries: countries,
            pushToken: pushToken,
            core: core)
    }

    private static func configuredDBRepositories(modelContainer: ModelContainer)
        -> DIContainer.DBRepositories
    {
        let mainDBRepository = MainDBRepository(modelContainer: modelContainer)
        return .init(countries: mainDBRepository, message: mainDBRepository, channel: mainDBRepository)
    }

    private static func configuredModelContainer() -> ModelContainer {
        do {
            return try ModelContainer.appModelContainer()
        } catch {
            // Log the error
            return ModelContainer.stub
        }
    }

    private static func configuredInteractors(
        appState: Store<AppState>,
        webRepositories: DIContainer.WebRepositories,
        dbRepositories: DIContainer.DBRepositories
    ) -> DIContainer.Interactors {
        let images = RealImagesInteractor(webRepository: webRepositories.images)
        let countries = RealCountriesInteractor(
            webRepository: webRepositories.countries,
            dbRepository: dbRepositories.countries)
        let userPermissions = RealUserPermissionsInteractor(
            appState: appState,
            openAppSettings: {
                URL(string: UIApplication.openSettingsURLString).flatMap {
                    UIApplication.shared.open($0, options: [:], completionHandler: nil)
                }
            })
        let message = RealMessageInteractor(
            dbRepository: dbRepositories.message,
            channelDBRepository: dbRepositories.channel,
            webRepository: webRepositories.core
        )
        return .init(
            images: images,
            countries: countries,
            userPermissions: userPermissions,
            message: message)
    }
}

extension AppEnvironment {
    var rootView: some View {
        VStack {
            if isRunningTests {
                Text("Running unit tests")
            } else {
                // CountriesList()
                LandmarkList()
                    .modifier(RootViewAppearance())
                    .modelContainer(modelContainer)
                    // .attachEnvironmentOverrides(onChange: onChangeHandler)
                    .inject(diContainer)
                if modelContainer.isStub {
                    Text("⚠️ There is an issue with local database")
                        .font(.caption2)
                }
            }
        }
    }

    // private var onChangeHandler: (EnvironmentValues.Diff) -> Void {
    //     return { diff in
    //         if !diff.isDisjoint(with: [.locale, .sizeCategory]) {
    //             self.diContainer.appState[\.routing] = AppState.ViewRouting()
    //         }
    //     }
    // }
}
