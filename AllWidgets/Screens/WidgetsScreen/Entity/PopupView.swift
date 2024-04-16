//
//  PopupView.swift
//  AllWidgets
//
//  Created by ANTON DOBRYNIN on 16.04.2024.
//

import SwiftUI

struct PopupView: View {
    var body: some View {
        VStack {
            Text("This is a Popup")
                .font(.title)
                .foregroundColor(.white)
                .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 170)
        .padding(.horizontal, 17)
        .background(Color.blue)
    }
}
