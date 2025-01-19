//
//  MessageInteractor.swift
//  CountriesSwiftUI
//
//  Created by xsuner on 2025/1/19.
//  Copyright © 2025 Alexey Naumov. All rights reserved.
//

protocol MessageInteractor {
    func connect()
    func send(_ message: String)
    func disconnect()
    func mockChannels() async throws
}

struct RealMessageInteractor: MessageInteractor {
    let client: TCPClient = TCPClient()
    let host: String = "192.168.10.4"
    let port: String = "5120"
    let dbRepository: MessageDBRepository
    let channelDBRepository: ChannelDBRepository

    func connect() {
        client.connect(to: host, port: UInt16(port)!)
        client.messageReceivedCallback = { message in
            Task {
                switch message {
                case let coreSend as Core_Recv:
                    print("Received message: \(coreSend)")
                    do {
                        try await dbRepository.store(
                            message: DBModel.Message(
                                messageID: coreSend.messageID,
                                messageSeq: coreSend.messageSeq,
                                cmessageID: coreSend.cmessageID,
                                cmessageSeq: coreSend.cmessageSeq,
                                timestamp: coreSend.timestamp,
                                channelID: coreSend.channelID,
                                channelType: coreSend.channelType,
                                topic: coreSend.topic,
                                userID: coreSend.userID,
                                payload: coreSend.payload
                            ))
                    } catch {
                        // Handle error
                        print(error)
                    }
                default:
                    print("Unknown message type")
                    break
                }
            }
        }
    }

    func send(_ message: String) {
        client.sendMessage(message)
    }

    func disconnect() {
        client.disconnect()
    }

    func mockChannels() async throws {
        try! await channelDBRepository.mock()
    }
}

struct StubMessageInteractor: MessageInteractor {
    func connect() {
    }

    func send(_ message: String) {
    }

    func disconnect() {
    }

    func mockChannels() async throws {
    }
}
