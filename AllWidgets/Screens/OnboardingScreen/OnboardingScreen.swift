//
//  OnboardingScreen.swift
//  AllWidgets
//
//  Created by ANTON DOBRYNIN on 10.04.2024.
//

import SwiftUI

struct OnboardingScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let onClose: () -> Void
    
    @ObservedObject var viewModel: OnboardingViewModel = OnboardingViewModel()
    @State private var selection = 0
    
    var body: some View {
        VStack {
            TabView(selection: $selection) {
                ForEach(viewModel.oboardingScreens) { item in
                    VStack {
                        Text("\(item.text)")
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundStyle(Colors.dark_main_color)
                            .font(.system(size: 17, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.top, 25)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 24)
                        
                        HStack(spacing: 0) {
                            ZStack {
                                Button {
                                    if selection == viewModel.oboardingScreens.count - 1 {
                                        onClose()
                                    } else {
                                        withAnimation {
                                            selection -= 1
                                        }
                                    }
                                } label: {
                                    Image("ic_to_the_left")
                                        .resizable()
                                        .frame(width: 10, height: 17)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 20)
                                .padding(.top, -20)
                                .transition(.opacity)
                                .opacity(selection == 0 ? 0 : 1)
                                
                                Image("\(item.image_name)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.top, -60)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                
                                Button {
                                    if selection == viewModel.oboardingScreens.count - 1 {
                                        onClose()
                                    } else {
                                        withAnimation {
                                            selection += 1
                                        }
                                    }
                                } label: {
                                    Image("ic_to_the_right")
                                        .resizable()
                                        .frame(width: 10, height: 17)
                                }
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing, 20)
                                .padding(.top, -20)
                                .transition(.opacity)
                                .opacity(selection == viewModel.oboardingScreens.count - 1 ? 0 : 1)
                            }
                        }
                        
                        Button {
                            presentationMode.wrappedValue.dismiss()
                            onClose()
                        } label: {
                            Text("Finish!")
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
//                        .padding(.top, -60)
                        .padding(.horizontal, 24)
                        .opacity(selection == viewModel.oboardingScreens.count - 1 ? 1 : 0)
                        .transition(.opacity)
                    }
                    .tag(item.id)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            UserDefaults.standard.setValue(true, forKey: "ShownOnboarding")
        }
    }
}
