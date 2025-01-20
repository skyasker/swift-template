//
//  DIContainer.swift
//  CountriesSwiftUI
//
//  Created by Alexey on 7/11/24.
//  Copyright © 2024 Alexey Naumov. All rights reserved.
//

import SwiftData
import SwiftUI

struct DIContainer {

    let appState: Store<AppState>
    let interactors: Interactors
    let modelData = ModelData()

    init(appState: Store<AppState> = .init(AppState()), interactors: Interactors) {
        self.appState = appState
        self.interactors = interactors
    }

    init(appState: AppState, interactors: Interactors) {
        self.init(appState: Store<AppState>(appState), interactors: interactors)
    }
}

extension DIContainer {
    struct WebRepositories {
        let images: ImagesWebRepository
        let countries: CountriesWebRepository
        let pushToken: PushTokenWebRepository
        let core: CoreWebRepository
    }
    struct DBRepositories {
        let countries: CountriesDBRepository
        let message: MessageDBRepository
        let channel: ChannelDBRepository
    }
    struct Interactors {
        let images: ImagesInteractor
        let countries: CountriesInteractor
        let userPermissions: UserPermissionsInteractor
        let message: MessageInteractor

        static var stub: Self {
            .init(
                images: StubImagesInteractor(),
                countries: StubCountriesInteractor(),
                userPermissions: StubUserPermissionsInteractor(),
                message: StubMessageInteractor())
        }
    }
}

extension EnvironmentValues {
    @Entry var injected: DIContainer = DIContainer(appState: AppState(), interactors: .stub)
}

extension View {
    func inject(_ container: DIContainer) -> some View {
        return
            self
            .environment(\.injected, container)
    }
}
