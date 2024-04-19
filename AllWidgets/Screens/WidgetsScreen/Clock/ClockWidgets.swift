//
//  ClockWidgets.swift
//  AllWidgets
//
//  Created by ANTON DOBRYNIN on 11.04.2024.
//

import SwiftUI

enum TypeOfClockWidget: String {
    case basic
    case halfOnHalf
    case bigger
    case red
    case clear
    case clearWhite
}

struct ClockWidgets: View {
    
    enum SizeOfWidget: String {
        case small
        case medium
    }
    
    @State var type: TypeOfClockWidget = .basic
    @State var size: SizeOfWidget = .small
    
    var body: some View {
        VStack {
            VStack {
                Image(getPreviewImage(type: type, and: .medium))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(16)
            }
            .frame(maxWidth: .infinity, minHeight: 158, maxHeight: 158)
            .padding(.top, 32)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func getPreviewImage(type: TypeOfClockWidget, and size: SizeOfWidget) -> String {
        
        switch type {
        case .basic:
            switch size {
            case .small:
                return "ic_clock_basic_preview-small"
            case .medium:
                return "ic_clock_basic_preview-large"
            }
        case .halfOnHalf:
            switch size {
            case .small:
                return "ic_clock_halfOnHalf_preview-small"
            case .medium:
                return "ic_clock_halfOnHalf_preview-large"
            }
        case .bigger:
            switch size {
            case .small:
                return "ic_clock_bigger_preview-small"
            case .medium:
                return "ic_clock_bigger_preview-large"
            }
        case .red:
            switch size {
            case .small:
                return "ic_clock_red_preview-small"
            case .medium:
                return "ic_clock_red_preview-large"
            }
        case .clear:
            switch size {
            case .small:
                return "ic_clock_clear_preview-small"
            case .medium:
                return "ic_clock_clear_preview-large"
            }
        case .clearWhite:
            switch size {
            case .small:
                return "ic_clock_clearWhite_preview-small"
            case .medium:
                return "ic_clock_clearWhite_preview-large"
            }
        }
    }
}

#Preview {
    ClockWidgets(type: .basic)
}
