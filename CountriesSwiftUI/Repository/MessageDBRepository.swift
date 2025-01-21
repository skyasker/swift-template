//
//  MessageDBRepository.swift
//  CountriesSwiftUI
//
//  Created by xsuner on 2025/1/19.
//  Copyright © 2025 Alexey Naumov. All rights reserved.
//

import Foundation
import SwiftData

protocol MessageDBRepository {
    func store(message: DBModel.Message) async throws
}

extension MainDBRepository: MessageDBRepository {

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

    func store(message: DBModel.Message) async throws {
        try modelContext.transaction {
            modelContext.insert(message)
            print("Message stored: \(message.channelID) - \(message.messageID)")
        }
    }
}
