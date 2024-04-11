//
//  AllWidgetsApp.swift
//  AllWidgets
//
//  Created by ANTON DOBRYNIN on 10.04.2024.
//

import SwiftUI
import PopupView

enum Route {
    case Launch
    case MainRoute
    case Onboarding
}

@main
struct AllWidgetsApp: App {
    
    @State private var isNeedToPresentWidgetPreviewPopUP: Bool = false
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
                            WallspaperScreen()
                                .navigationTitle("Wallpaper")
                        case .widgets:
                            WidgetsScreen(isNeedToPresentWidgetPreviewPopUP: $isNeedToPresentWidgetPreviewPopUP)
                                .navigationTitle("AllWidgets")
                        case .settings:
                            SettingsScreen()
                                .navigationTitle("Settings")
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .overlay(
                        TabBar(selectedTab: $selectedTab), alignment: .bottom
                    )
                    .popup(isPresented: $isNeedToPresentWidgetPreviewPopUP) {
                        VStack {
                            VStack {
                                Text("Preview")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(Colors.main_nav_title_color)
                                    .font(.system(size: 17,weight: .bold))
                                
                                
                                Spacer()
                                
                                #warning("TODO: PreviewWidgets")
                                Text("1")
                                
                                Spacer()
                                
                                Button {
                                    print("SEET!")
                                } label: {
                                    Text("Set widgets")
                                        .font(.system(size: 17, weight: .bold))
                                        .foregroundStyle(.white)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                }
                                .frame(height: 50)
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(
                                            colors: [
                                                Colors.main_dark_blue_color,
                                                Colors.main_blue_color
                                            ]
                                        ),
                                        startPoint: .bottomTrailing,
                                        endPoint: .topLeading
                                    )
                                    .cornerRadius(15)
                                )
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 16)

                        }
                        .frame(maxWidth: .infinity, maxHeight: 336, alignment: .center)
                        .background(.white)
                        .cornerRadius(14)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 16)
                    } customize: {
                        $0.backgroundColor(.black.opacity(0.5))
                    }
                }
            case .Onboarding:
                OnboardingScreen(onClose: {
                    route = .MainRoute
                })
            }
        }
    }
}
