
//
//  Message.swift
//  CountriesSwiftUI
//
//  Created by xsuner on 2025/1/19.
//  Copyright © 2025 Alexey Naumov. All rights reserved.
//


import Foundation
import SwiftData

// MARK: - Database Model

extension DBModel {

    @Model final class Channel {

        var messageID: Int64 = 0
        var messageSeq: Int64 = 0
        var cmessageID: String = String()
        var cmessageSeq: Int64 = 0
        var timestamp: Int64 = 0
        var channelID: String = String()
        var channelType: Int32 = 0
        var userID: String = String()
        var text: String = String()
        var avatar: String = String()
        var name: String = String()
        var unread: Int32 = 0

        // var name: String
        // var translations: [String: String?]
        // var population: Int
        // var flag: URL?
        // @Attribute(.unique) var alpha3Code: String
        // @Relationship(inverse: \CountryDetails.neighbors) var neighbors: [CountryDetails] = []

        init(
            messageID: Int64,
            messageSeq: Int64,
            cmessageID: String,
            cmessageSeq: Int64,
            timestamp: Int64,
            channelID: String,
            channelType: Int32,
            userID: String,
            avatar: String,
            name: String,
            text: String,
            unread: Int32
        ) {
            self.messageID = messageID
            self.messageSeq = messageSeq
            self.cmessageID = cmessageID
            self.cmessageSeq = cmessageSeq
            self.timestamp = timestamp
            self.channelID = channelID
            self.channelType = channelType
            self.userID = userID
            self.avatar = avatar
            self.name = name
            self.text = text
            self.unread = unread
        }

        // func name(locale: Locale) -> String {
        //     let localeId = locale.shortIdentifier
        //     if let value = translations[localeId], let localizedName = value {
        //         return localizedName
        //     }
        //     return name
        // }
    }
}
