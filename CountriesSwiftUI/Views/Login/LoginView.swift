//
//  LoginView.swift
//  CountriesSwiftUI
//
//  Created by xsun on 2025/1/21.
//  Copyright © 2025 Alexey Naumov. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
    @State private var isLoading = false
    @State private var loginTask: Task<Void, Never>?
    @Environment(\.injected) private var injected: DIContainer

    var body: some View {
        VStack(spacing: 20) {
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.bold)

            TextField("Username", text: $username)
            SecureField("Password", text: $password)

            Button(action: {
                isLoading = true
                loginTask = Task {
                    if validateCredentials() {
                        UserDefaults.standard.set(true, forKey: "isLoggedIn")
                        UserDefaults.standard.set(username, forKey: "userId")
                        injected.appState[\.user.isLoggedIn] = true
                        injected.interactors.message.connect(userId: username)
                        isLoading = false
                    } else {
                        isLoading = false
                        showingAlert = true
                    }
                }
            }) {
                if isLoading {
                    ProgressView()
                } else {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .disabled(isLoading)
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("Invalid Credentials"),
                    message: Text("Please check your username and password."),
                    dismissButton: .default(Text("OK")))
            }
        }
        .padding()
    }

    func validateCredentials() -> Bool {
        return !username.isEmpty && !password.isEmpty
    }
}
