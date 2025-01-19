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
    @Published var receivedMessage: String = ""
    @Published var status: String = "Disconnected"
    var messageReceivedCallback: ((Message) -> Void)?

    func connect(to host: String, port: UInt16) {
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
                    framer.userID = "user1"
                    let data = encode(framer)

                    print("Encoded Data: \(data.base64EncodedString())")

                    self?.sendData(data)

                // let cp = decode(data)
                // if let cp = cp {
                //     print("Decoded Data: \(cp)")
                // }

                case .failed(let error):
                    self?.status = "Failed: \(error.localizedDescription)"
                default:
                    break
                }
            }
        }

        connection?.start(queue: .main)
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

    func sendMessage(_ message: String) {
        var framer = Core_Send()
        framer.payload = Data(message.utf8)
        framer.channelID = "ch1"
        framer.channelType = 2
        let data = encode(framer)

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
                    print("Decoded Data: \(cp)")
                    DispatchQueue.main.async {
                        self?.messageReceivedCallback?(cp)
                    }
                }
                self?.receiveData()  // Continue receiving
            } else if let error = error {
                print("Receive error: \(error.localizedDescription)")
            }

            // if let data: Data = data, let message = String(data: data, encoding: .utf8) {
            //     DispatchQueue.main.async {
            //         self?.receivedMessage = message
            //         // self?.receivedMessage = String(cp?.remainingLength ?? 0)
            //     }
            //     self?.receiveData()  // Continue receiving
            // } else if let error = error {
            //     print("Receive error: \(error.localizedDescription)")
            // }
        }
    }

    func disconnect() {
        connection?.cancel()
        connection = nil
        status = "Disconnected"
    }
}

struct TCPView: View {
    @StateObject private var client = TCPClient()
    @State private var host: String = "192.168.10.4"
    @State private var port: String = "5110"
    @State private var message: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("TCP Client").font(.largeTitle)
            TextField("Host", text: $host).textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Port", text: $port).textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Connect") {
                if let port = UInt16(port) {
                    client.connect(to: host, port: port)
                }
            }
            .disabled(client.status == "Connected")
            Text("Status: \(client.status)")
            TextField("Message", text: $message).textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Send") {
                client.sendMessage(message)
                message = ""
            }
            .disabled(client.status != "Connected")
            Text("Received: \(client.receivedMessage)")
            Button("Disconnect") {
                client.disconnect()
            }
            .disabled(client.status != "Connected")
        }
        .padding()
    }
}
