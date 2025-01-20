//
//  ProfileInteractor.swift
//  CountriesSwiftUI
//
//  Created by xsuner on 2025/1/19.
//  Copyright © 2025 Alexey Naumov. All rights reserved.
//

protocol ProfileInteractor {
    func login(uid: String, password: String)
    func logout()
}

// struct RealProfileInteractor: ProfileInteractor {
// }

// struct StubProfileInteractor: ProfileInteractor {
    
// }
