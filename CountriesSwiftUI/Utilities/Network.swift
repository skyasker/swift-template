//
//  Network.swift
//  CountriesSwiftUI
//
//  Created by xsuner on 2025/1/19.
//  Copyright © 2025 Alexey Naumov. All rights reserved.
//

// import CryptoKit
import Foundation
import Network
import SwiftProtobuf
import SwiftUI

// struct Curve25519Util {
//     // Generate a Curve25519 Key Pair
//     static func getCurve25519KeyPair() -> (
//         privateKey: Curve25519.KeyAgreement.PrivateKey, publicKey: Data
//     ) {
//         let privateKey = Curve25519.KeyAgreement.PrivateKey()
//         let publicKey = privateKey.publicKey.rawRepresentation
//         return (privateKey: privateKey, publicKey: publicKey)
//     }

//     // Generate a Curve25519 Shared Key
//     static func getCurve25519SharedKey(
//         privateKey: Curve25519.KeyAgreement.PrivateKey, publicKeyData: Data
//     ) -> SharedSecret? {
//         do {
//             let publicKey = try Curve25519.KeyAgreement.PublicKey(rawRepresentation: publicKeyData)
//             let sharedSecret = try privateKey.sharedSecretFromKeyAgreement(with: publicKey)
//             return sharedSecret
//         } catch {
//             print("Error generating shared key: \(error)")
//             return nil
//         }
//     }
// }

class TCPClient: ObservableObject {
    private var connection: NWConnection?
    private var host: String = ""
    private var port: UInt16 = 0
    private var userId: String = ""
    private var reconnectTimer: Timer?
    @Published var receivedMessage: String = ""
    @Published var status: String = "Disconnected"
    var messageReceivedCallback: ((Message) -> Void)?

    func connect(to host: String, port: UInt16, userId: String) {
        if connection != nil {
            disconnect()
        }

        self.host = host
        self.port = port
        self.userId = userId
        let parameters = NWParameters.tcp
        connection = NWConnection(
            host: NWEndpoint.Host(host), port: NWEndpoint.Port(rawValue: port)!, using: parameters)

        connection?.stateUpdateHandler = { [weak self] state in
            DispatchQueue.main.async {
                switch state {
                case .ready:
                    self?.status = "Connected"
                    self?.receiveData()

                    var framer = Core_Conn()
                    framer.userID = userId
                    let data = encode(framer)

                    // print("Encoded Data: \(data.base64EncodedString())")

                    self?.sendData(data)

                // let cp = decode(data)
                // if let cp = cp {
                //     print("Decoded Data: \(cp)")
                // }

                case .failed(let error):
                    self?.status = "Failed: \(error.localizedDescription)"
                    self?.scheduleReconnect()
                default:
                    break
                }
            }
        }

        connection?.start(queue: .main)
    }

    private func scheduleReconnect() {
        reconnectTimer?.invalidate()
        reconnectTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { [weak self] _ in
            self?.reconnect()
        }
    }

    private func reconnect() {
        disconnect()
        connect(to: host, port: port, userId: userId)
    }

    func sendData(_ data: Data) {
        connection?.send(
            content: data,
            completion: .contentProcessed { error in
                if let error = error {
                    print("Send error: \(error.localizedDescription)")
                } else {
                    print("Data sent")
                }
            })
    }


    func send(_ message: Message) {
        let data = encode(message)
        connection?.send(
            content: data,
            completion: .contentProcessed { error in
                if let error = error {
                    print("Send error: \(error.localizedDescription)")
                } else {
                    print("Message sent: \(message)")
                }
            })
    }

    private func receiveData() {
        connection?.receive(minimumIncompleteLength: 1, maximumLength: 4096) {
            [weak self] data, _, _, error in
            print("Received Data: \(data?.base64EncodedString() ?? "No data")")

            if let data = data {
                let cp = decode(data)
                if let cp = cp {
                    // print("Decoded Data: \(cp)")
                    DispatchQueue.main.async {
                        for message in cp {
                            self?.messageReceivedCallback?(message)
                        }
                    }
                }
                self?.receiveData()  // Continue receiving
            } else if let error = error {
                print("Receive error: \(error.localizedDescription)")
            }
        }
    }

    func disconnect() {
        connection?.cancel()
        connection = nil
        status = "Disconnected"
    }
}
