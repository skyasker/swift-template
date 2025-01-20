//
//  MessageDBRepository.swift
//  CountriesSwiftUI
//
//  Created by xsuner on 2025/1/19.
//  Copyright © 2025 Alexey Naumov. All rights reserved.
//

import Foundation
import SwiftData

protocol ChannelDBRepository {
    func store(channel: DBModel.Channel) async throws
    func mock() async throws
    func delete(_ channel: DBModel.Channel) async throws
}

extension MainDBRepository: ChannelDBRepository {

    // @MainActor
    // func countryDetails(for country: DBModel.Country) async throws -> DBModel.CountryDetails? {
    //     let alpha3Code = country.alpha3Code
    //     let fetchDescriptor = FetchDescriptor(
    //         predicate: #Predicate<DBModel.CountryDetails> {
    //             $0.alpha3Code == alpha3Code
    //         })
    //     return try modelContainer.mainContext.fetch(fetchDescriptor).first
    // }

    // func store(countries: [ApiModel.Country]) async throws {
    //     try modelContext.transaction {
    //         countries
    //             .map { $0.dbModel() }
    //             .forEach {
    //                 modelContext.insert($0)
    //             }
    //     }
    // }

    // func store(countryDetails: ApiModel.CountryDetails, for country: DBModel.Country) async throws {
    //     let alpha3Code = country.alpha3Code
    //     try modelContext.transaction {
    //         let currencies = countryDetails.currencies.map { $0.dbModel() }
    //         let neighborsFetch = FetchDescriptor(
    //             predicate: #Predicate<DBModel.Country> {
    //                 countryDetails.borders.contains($0.alpha3Code)
    //             })
    //         let neighbors = try modelContext.fetch(neighborsFetch)
    //         currencies.forEach {
    //             modelContext.insert($0)
    //         }
    //         let object = DBModel.CountryDetails(
    //             alpha3Code: alpha3Code,
    //             capital: countryDetails.capital,
    //             currencies: currencies,
    //             neighbors: neighbors)
    //         modelContext.insert(object)
    //     }
    // }

    func store(channel: DBModel.Channel) async throws {
        try modelContext.transaction {
            modelContext.insert(channel)
        }
    }

    // var messageID: Int64 = 0
    // var messageSeq: Int64 = 0
    // var cmessageID: String = String()
    // var cmessageSeq: Int64 = 0
    // var timestamp: Int64 = 0
    // var channelID: String = String()
    // var channelType: Int32 = 0
    // var userID: String = String()
    // var text: String = String()
    // var avatar: String = String()
    // var name: String = String()
    // var unread: Int32 = 0

    func mock() async throws {
        let avatars = [
            "turtlerock",
            "silversalmoncreek",
            "chilkoottrail",
            "stmarylake",
            "twinlake",
            "lakemcdonald",
            "charleyrivers",
            "icybay",
            "rainbowlake",
            "hiddenlake",
            "chincoteague",
            "umbagog",
        ]

        for i in 0..<100 {
            try modelContext.transaction {
                let channel = DBModel.Channel(
                    messageID: Int64(i),
                    messageSeq: Int64(i),
                    cmessageID: "1",
                    cmessageSeq: 1,
                    timestamp: Int64(Date().timeIntervalSince1970),
                    channelID: "ch" + String(i),
                    channelType: 2,
                    userID: "user" + String(i),
                    avatar: avatars[i % avatars.count],
                    name: "用户" + String(i),
                    text: "这是我们的消息内容",
                    unread: 0
                )
                modelContext.insert(channel)
            }
        }
    }

    func delete(_ channel: DBModel.Channel) async throws {
        try modelContext.transaction {
            modelContext.delete(channel)
        }
    }
}
