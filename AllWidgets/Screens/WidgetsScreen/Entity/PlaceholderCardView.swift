//
//  PlaceholderCardView.swift
//  AllWidgets
//
//  Created by ANTON DOBRYNIN on 16.04.2024.
//

import SwiftUI

struct PlaceholderCardView : View {
    let color: Color

    var body: some View {
        ZStack {
            Rectangle()
                .fill(color)
                .cornerRadius(16)
                .frame(maxWidth: .infinity, minHeight: 158, maxHeight: 158)
                .padding(.top, 16)
        }
        .shadow(radius: 6)
    }
}
