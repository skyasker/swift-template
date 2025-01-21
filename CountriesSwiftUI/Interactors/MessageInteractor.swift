//
//  MessageInteractor.swift
//  CountriesSwiftUI
//
//  Created by xsuner on 2025/1/19.
//  Copyright © 2025 Alexey Naumov. All rights reserved.
//

import SwiftProtobuf

protocol MessageInteractor {
    func connect(userId: String)
    func send(_ message: Message)
    func disconnect()
    func mockChannels() async throws
    func deleteChannel(_ channel: DBModel.Channel) async throws
}

struct RealMessageInteractor: MessageInteractor {
    let client: TCPClient = TCPClient()
    let dbRepository: MessageDBRepository
    let channelDBRepository: ChannelDBRepository
    let webRepository: CoreWebRepository

    func connect(userId: String) {
        Task {
            do {
                let addr = try await webRepository.allocate(userId: userId)
                print("Allocated address: \(addr)")
                let components = addr.addr.split(separator: ":")
                if components.count == 2 {
                    let host = String(components[0])
                    let port = String(components[1])
                    print("Host: \(host), Port: \(port)")
                    client.connect(to: host, port: UInt16(port)!, userId: userId)
                } else {
                    print("Invalid address format")
                }
            } catch (let error) {
                print("Failed to allocate address: \(error)")
            }
        }

        client.messageReceivedCallback = { message in
            Task {
                switch message {
                case let m as Core_Recv:
                    print("Received message: \(String(data: m.payload, encoding: .utf8) ?? "")")
                    let m = DBModel.Message(
                        messageID: m.messageID,
                        messageSeq: m.messageSeq,
                        cmessageID: m.cmessageID,
                        cmessageSeq: m.cmessageSeq,
                        timestamp: m.timestamp,
                        channelID: m.channelID,
                        channelType: m.channelType,
                        topic: m.topic,
                        userID: m.userID,
                        payload: m.payload
                    )
                    do {
                        try await dbRepository.store(message: m)
                        try await channelDBRepository.upsertByMessage(message: m)
                    } catch {
                        // Handle error
                        print(error)
                    }
                default:
                    print("Unknown message type \(message)")
                    break
                }
            }
        }
    }

    func send(_ message: Message) {
        client.send(message)
    }

    func disconnect() {
        client.disconnect()
    }

    func mockChannels() async throws {
        try! await channelDBRepository.mock()
    }

    func deleteChannel(_ channel: DBModel.Channel) async throws {
        try! await channelDBRepository.delete(channel)
    }
}

struct StubMessageInteractor: MessageInteractor {
    func connect(userId: String) {
    }

    func send(_ message: Message) {
    }

    func disconnect() {
    }

    func mockChannels() async throws {
    }

    func deleteChannel(_ channel: DBModel.Channel) async throws {
    }
}
