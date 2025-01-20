//
//  CoreWebRepository.swift
//  CoreSwiftUI
//
//  Created by Alexey on 7/11/24.
//  Copyright © 2024 Alexey Naumov. All rights reserved.
//

import Foundation

protocol CoreWebRepository: WebRepository {
    func allocate() async throws -> Core_Addr
}

struct RealCoreWebRepository: CoreWebRepository {

    let session: URLSession
    let baseURL: String

    init(session: URLSession) {
        self.session = session
        self.baseURL = "http://192.168.0.147:8888/rpc"
    }

    func allocate() async throws -> Core_Addr {
        return try await rpc(endpoint: API.allocate)
    }

    // func details(country: DBModel.Country) async throws -> ApiModel.CountryDetails {
    //     let response: [ApiModel.CountryDetails] = try await call(
    //         endpoint: API.countryDetails(countryName: country.name))
    //     guard let details = response.first else {
    //         throw APIError.unexpectedResponse
    //     }
    //     return details
    // }
}

// MARK: - Endpoints

extension RealCoreWebRepository {
    enum API {
        case allocate
        case countryDetails(countryName: String)
    }
}

extension RealCoreWebRepository.API: APICall {
    var path: String {
        switch self {
        case .allocate:
            return "/core.Core/Allocate"
        case let .countryDetails(countryName):
            let encodedName = countryName.addingPercentEncoding(
                withAllowedCharacters: .urlQueryAllowed)
            return "/name/\(encodedName ?? countryName)"
        }
    }
    var method: String {
        switch self {
        case .allocate, .countryDetails:
            return "POST"
        }
    }
    var headers: [String: String]? {
        return [
            "Accept": "application/x-protobuf",
            "Content-Type": "application/x-protobuf",
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiJ1c2VyMSIsInJvbGUiOiJhZG1pbiIsInNuIjoiMTczNzA4MTI4MDk3NjUxOSIsImFkZHIiOiIxOTIuMTY4LjAuMTQ3In0.IZVbm7cMv3nWvGeVdrqCAo8HtM1AE-lrj8j9mBrO4ws",
        ]
    }
    func body() throws -> Data? {
        switch self {
        case .allocate:
            var message = Core_AllocateArgs()
            message.userID = "user1"
            return try message.serializedData()
        case .countryDetails:
            return nil
        }
    }
}
