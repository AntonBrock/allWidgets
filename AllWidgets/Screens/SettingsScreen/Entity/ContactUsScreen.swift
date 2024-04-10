//
//  ContactUsScreen.swift
//  AllWidgets
//
//  Created by ANTON DOBRYNIN on 10.04.2024.
//

import SwiftUI
import CustomTextField

struct ContactUsScreen: View {
    
    @State var nameText: String = ""
    @State var surName: String = ""
    @State var email: String = ""
    
    @State var maxCount: Int = 160
    
    var body: some View {
        
        VStack {
            Text("Fill in the fields below so we can contact you")
                .foregroundColor(Colors.main_nav_title_color)
                .font(.system(size: 34, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 16)
                .padding(.top, 16)
            
            Text("We will definitely answer you")
                .foregroundColor(Colors.main_nav_title_color)
                .font(.system(size: 17, weight: .light))
                .multilineTextAlignment(.center)
            
            VStack(spacing: 22) {
                EGTextField(text: $nameText)
                    .setBorderColor(Colors.main_gray_color)
                    .setPlaceHolderText("Name")
                    .setFocusedBorderColorEnable(true)
                    .setFocusedBorderColor(Colors.main_active_border_color)
                    .setPlaceHolderTextColor(Colors.main_dark_gray_color)
                    .setCornerRadius(10)
                
                
                EGTextField(text: $surName)
                    .setBorderColor(Colors.main_gray_color)
                    .setPlaceHolderText("Surname")
                    .setFocusedBorderColorEnable(true)
                    .setPlaceHolderTextColor(Colors.main_dark_gray_color)
                    .setFocusedBorderColor(Colors.main_active_border_color)
                    .setCornerRadius(10)
                
                EGTextField(text: $email)
                    .setBorderColor(Colors.main_gray_color)
                    .setPlaceHolderText("E-mail")
                    .setFocusedBorderColorEnable(true)
                    .setPlaceHolderTextColor(Colors.main_dark_gray_color)
                    .setFocusedBorderColor(Colors.main_active_border_color)
                    .setCornerRadius(10)
                
                    #warning("TODO: Сделать Компонетнт")
            }
            .padding(.top, 40)
            
            Spacer()
            
            Button {
                print("ACTION")
            } label: {
                Text("Send")
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
            .padding(.bottom, 28)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 16)
    }
}

