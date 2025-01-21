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

    @Model final class Message {
        #Index<Message>([\.channelID], [\.messageID])

        var expire: Int64 = 0
        var messageID: Int64 = 0
        var messageSeq: Int64 = 0
        var cmessageID: String = String()
        var cmessageSeq: Int64 = 0
        var timestamp: Int64 = 0
        var channelID: String = String()
        var channelType: Int32 = 0
        var topic: String = String()
        var userID: String = String()
        var payload: Data = Data()

        init(
            messageID: Int64,
            messageSeq: Int64,
            cmessageID: String,
            cmessageSeq: Int64,
            timestamp: Int64,
            channelID: String,
            channelType: Int32,
            topic: String,
            userID: String,
            payload: Data
        ) {
            self.messageID = messageID
            self.messageSeq = messageSeq
            self.cmessageID = cmessageID
            self.cmessageSeq = cmessageSeq
            self.timestamp = timestamp
            self.channelID = channelID
            self.channelType = channelType
            self.topic = topic
            self.userID = userID
            self.payload = payload
        }

        func isFrom(userId: String) -> Bool {
            return self.userID == userId
        }

        func message() -> String {
            return String(data: payload, encoding: .utf8) ?? ""
        }
    }
}