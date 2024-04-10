//
//  SettingsScreen.swift
//  AllWidgets
//
//  Created by ANTON DOBRYNIN on 10.04.2024.
//

import SwiftUI
import StoreKit

struct SettingsScreen: View {
    
    @State var title: String = "Settings"
    var body: some View {
        
        VStack {
//            CustomNavigationView(title: $title)
            
            ScrollView {
                VStack(spacing: 14) {
                    
                    // Rate
                    Button {
                        SKStoreReviewController.requestReview()
                    } label: {
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.white)
                                    .frame(width: 36, height: 36)
                                
                                Image("ic_settings-main_rate")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                            .padding(10)
                            
                            Text("Rate app")
                                .foregroundStyle(.white)
                                .font(.system(size: 17, weight: .medium))
                                .padding(.leading, -5)
                            
                            Spacer()
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(.white)
                                    .frame(width: 24, height: 24)
                                
                                Image("ic_settings-to_the_right")
                            }
                            .padding(10)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Colors.main_blue_color.opacity(0.3))
                    .cornerRadius(15)
                    
                    // Privacy
                    Button {
                        print("Action")
                    } label: {
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.white)
                                    .frame(width: 36, height: 36)
                                
                                Image("ic_settings-main_privacy")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                            .padding(10)
                            
                            Text("Privacy Policy")
                                .foregroundStyle(.white)
                                .font(.system(size: 17, weight: .medium))
                                .padding(.leading, -5)
                            
                            Spacer()
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(.white)
                                    .frame(width: 24, height: 24)
                                
                                Image("ic_settings-to_the_right")
                            }
                            .padding(10)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Colors.main_blue_color.opacity(0.3))
                    .cornerRadius(15)
                    
                    // Contact
                    Button {
                        print("Action")
                    } label: {
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.white)
                                    .frame(width: 36, height: 36)
                                
                                Image("ic_settings-mail")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                            .padding(10)
                            
                            NavigationLink(destination: ContactUsScreen()) {
                                Text("Contact us")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 17, weight: .medium))
                                    .padding(.leading, -5)
                                
                                Spacer()
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(.white)
                                        .frame(width: 24, height: 24)
                                    
                                    Image("ic_settings-to_the_right")
                                }
                                .padding(10)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Colors.main_blue_color.opacity(0.3))
                    .cornerRadius(15)
                    
                    // Share the app
                    Button {
                        print("Action")
                    } label: {
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.white)
                                    .frame(width: 36, height: 36)
                                
                                Image("ic_settings-sharing")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                            .padding(10)
                            
                            Text("Share the app")
                                .foregroundStyle(.white)
                                .font(.system(size: 17, weight: .medium))
                                .padding(.leading, -5)
                            
                            Spacer()
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(.white)
                                    .frame(width: 24, height: 24)
                                
                                Image("ic_settings-to_the_right")
                            }
                            .padding(10)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Colors.main_blue_color.opacity(0.3))
                    .cornerRadius(15)
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.top, 16)
            .padding(.horizontal, 16)

                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}
