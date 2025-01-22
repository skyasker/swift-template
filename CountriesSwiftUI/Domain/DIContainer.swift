//
//  DIContainer.swift
//  CountriesSwiftUI
//
//  Created by Alexey on 7/11/24.
//  Copyright © 2024 Alexey Naumov. All rights reserved.
//

import SwiftData
import SwiftUI

enum DomainModel {
    struct User: Identifiable {
        var id: String
        var name: String
        var avatar: String
    }

    struct Channel: Identifiable {
        var id: String
        var name: String
        var avatar: String
        var unread: Int
        var message: Message
        var messages: [Message]
        var user: User
        var users: [User]
    }

    struct Message: Identifiable {
        var id: String
        var content: String
        var user: User
        var date: Date
        var readed: Bool
        var readers: [User]
        var channelid: String
    }
}

@Observable
class Service {
    var channels: [DomainModel.Channel] = []
    var users: [DomainModel.User] = []

    init() {
        for userid in 0..<100 {
            let user = DomainModel.User(
                id: String(userid),
                name: "User \(userid)",
                avatar: "stmarylake")
            users.append(user)
        }
        for channelid in 0..<100 {
            var messages: [DomainModel.Message] = []
            for messageid in 0..<1000 {
                let message = DomainModel.Message(
                    id: String(channelid * 100 + messageid),
                    content: "Message \(messageid)",
                    user: users[0],
                    date: Date(),
                    readed: false,
                    readers: users,
                    channelid: String(channelid))
                messages.append(message)
            }
            let channel = DomainModel.Channel(
                id: String(channelid),
                name: "Channel \(channelid)",
                avatar: "stmarylake",
                unread: 99,
                message: messages[0],
                messages: messages,
                user: users[0],
                users: users)
            channels.append(channel)
        }
    }
}

struct DIContainer {

    let appState: Store<AppState>
    let interactors: Interactors
    let modelData = ModelData()
    let service: Service

    init(appState: Store<AppState> = .init(AppState()), service: Service, interactors: Interactors)
    {
        self.appState = appState
        self.interactors = interactors
        self.service = service
    }

    init(appState: AppState, service: Service, interactors: Interactors) {
        self.init(appState: Store<AppState>(appState), service: service, interactors: interactors)
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
    @Entry var injected: DIContainer = DIContainer(
        appState: AppState(), service: Service(), interactors: .stub)
}

extension View {
    func inject(_ container: DIContainer) -> some View {
        return
            self
            .environment(\.injected, container)
    }
}
