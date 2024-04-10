//
//  CustomNavigationView.swift
//  AllWidgets
//
//  Created by ANTON DOBRYNIN on 10.04.2024.
//

import SwiftUI

struct CustomNavigationView: View {
    
    @Binding var title: String
    
    var body: some View {
        VStack {
            Text("\(title)")
                .foregroundStyle(Colors.main_nav_title_color)
                .font(.system(size: 17, weight: .bold))
            
            Divider()
                .padding(.top, 12)
        }
        .frame(maxWidth: .infinity, maxHeight: 44, alignment: .center)
        .background(Colors.main_nav_color)
    }
}
