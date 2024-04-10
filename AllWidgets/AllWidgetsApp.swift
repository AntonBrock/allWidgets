//
//  AllWidgetsApp.swift
//  AllWidgets
//
//  Created by ANTON DOBRYNIN on 10.04.2024.
//

import SwiftUI

enum Route {
    case Launch
    case MainRoute
    case Onboarding
}

@main
struct AllWidgetsApp: App {
    
    @State private var selectedTab: Tab = .widgets
    @State var route: Route = .MainRoute
    
    var body: some Scene {
        WindowGroup {
            switch route {
            case .Launch:
                LaunchScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            withAnimation {
                                route = .Onboarding
                            }
                        }
                    }
            case .MainRoute:
                NavigationView {
                    VStack {
                        switch selectedTab {
                        case .wallpapers:
                            VStack { }
                        case .widgets:
                            VStack { }
                        case .settings:
                            SettingsScreen()
                        }
                        
                        TabBar(selectedTab: $selectedTab)
                    }
                    .navigationTitle(selectedTab.rawValue.capitalized)
                    .navigationBarTitleDisplayMode(.inline)
                }
                
            case .Onboarding:
                OnboardingScreen(onClose: {
                    route = .MainRoute
                })
            }
        }
    }
}
