//
//  LoginView.swift
//  CountriesSwiftUI
//
//  Created by xsun on 2025/1/21.
//  Copyright © 2025 Alexey Naumov. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    @State private var selection = 0
    // @Binding var isLoggedIn: Bool

    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                ForEach(0..<3) { index in
                    VStack {
                        Image(systemName: "star.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .padding()

                        Text("Welcome to App!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding()

                        Text("This is page \(index + 1) of the onboarding.")
                            .font(.body)
                            .padding()

                        if index == 2 {
                            NavigationLink(destination: LoginView()) {
                                Text("开始")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                            .simultaneousGesture(TapGesture().onEnded {
                                UserDefaults.standard.set(true, forKey: "isPreviewed")
                            })
                            .padding()
                        }
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}
