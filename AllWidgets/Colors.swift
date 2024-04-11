//
//  Colors.swift
//  AllWidgets
//
//  Created by ANTON DOBRYNIN on 10.04.2024.
//

import UIKit
import SwiftUI

final class Colors {
    static var purple_main_color: Color = Color(hex: "#6671E5")
    static var dark_main_color: Color = Color(hex: "#061D35")
    static var main_dark_blue_color: Color = Color(hex: "#6671E5")
    static var main_active_border_color: Color = Color(hex: "#5964E0")
    static var main_blue_color: Color = Color(hex: "#4852D9")
    static var main_gray_color: Color = Color(hex: "#D6D6D6")
    static var main_dark_gray_color: Color = Color(hex: "#8A8A8E")
    static var main_nav_color: Color = Color(hex: "#F9F9F9").opacity(0.79)
    static var main_nav_title_color: Color = Color(hex: "#053048")
    static var dark_text_color: Color = Color(hex: "#0A0F45")
    static var light_gray_color: Color = Color(hex: "#747480")
}

// MARK: - Extenstion
extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        print(cleanHexCode)
        var rgb: UInt64 = 0
        
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        
        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}
