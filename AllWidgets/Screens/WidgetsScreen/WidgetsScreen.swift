//
//  WidgetsScreen.swift
//  AllWidgets
//
//  Created by ANTON DOBRYNIN on 11.04.2024.
//

import SwiftUI

struct WidgetsScreen: View {
    
    @State private var selectedSegment = 0

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                HStack {
                    VStack {
                        Text("Widgets")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Colors.dark_text_color)
                            .font(.system(size: 34, weight: .bold))
                            .padding(.top, -40)
                        
                        HStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(selectedSegment == 0 ? Colors.main_active_border_color : Colors.light_gray_color.opacity(0.07))
                                .frame(width: 110, height: 28)
                                .overlay {
                                    Text("All widgets")
                                        .font(.system(size: 15, weight: .bold))
                                        .foregroundStyle(selectedSegment == 0 ? .white : Colors.main_active_border_color)
                                }
                                .onTapGesture {
                                    withAnimation {
                                        selectedSegment = 0
                                    }
                                }
                            
                            RoundedRectangle(cornerRadius: 20)
                                .fill(selectedSegment == 1 ? Colors.main_active_border_color : Colors.light_gray_color.opacity(0.07) )
                                .frame(width: 110, height: 28)
                                .overlay {
                                    Text("My widgets")
                                        .font(.system(size: 15, weight: .bold))
                                        .foregroundStyle(selectedSegment == 1 ? .white :  Colors.main_active_border_color)
                                }
                                .onTapGesture {
                                    withAnimation {
                                        selectedSegment = 1
                                    }
                                }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, -10)
                        
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: OnboardingScreen(onClose: {
                        print("1")
                    })) {
                        RoundedRectangle(cornerRadius: 77 / 2)
                            .fill(Colors.light_gray_color.opacity(0.07))
                            .frame(width: 77, height: 77)
                            .overlay {
                                Image("ic_widgets_quastion")
                                    .resizable()
                                    .frame(width: 25, height: 35)
                            }
                    }
                }
                .padding(.top, 16)
                
                Spacer()
                
                VStack {
                    if selectedSegment == 0 {
                        Text("Segment 1")
                    } else {
                        Text("Segment 2 ")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 16)
    }
}
