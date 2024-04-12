//
//  CalendarWidgets.swift
//  AllWidgets
//
//  Created by ANTON DOBRYNIN on 11.04.2024.
//

import SwiftUI

enum TypeOfCalendarWidget: String {
    case basic
    case halfOnHalf
    case simple
    case bigger
}

struct CalendarWidgets: View {
    
    enum SizeOfWidget: String {
        case small
        case medium
    }
    
//    @Binding var type: TypeOfCalendarWidget
    @State var type: TypeOfCalendarWidget
    @State var size: SizeOfWidget = .small
    
    var body: some View {
        VStack {
            if size == .small {
                VStack {
                    Image(getPreviewImage(type: type, and: .small))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(16)
                        .shadow(color: Color(hex: "ccd0f8").opacity(0.6), radius: 10, x: 2, y: 10)
                }
                .frame(maxWidth: 170, minHeight: 170, maxHeight: 170)
                .padding(.top, 16)
            } else {
                VStack {
                    Image(getPreviewImage(type: type, and: .medium))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(16)
                        .shadow(color: Color(hex: "ccd0f8").opacity(0.6), radius: 10, x: 2, y: 10)
                }
                .frame(maxWidth: .infinity, minHeight: 158, maxHeight: 158)
                .padding(.top, 16)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func getPreviewImage(type: TypeOfCalendarWidget, and size: SizeOfWidget) -> String {
        
        switch type {
        case .basic:
            switch size {
            case .small:
                return "ic_calendar_basic_preview-small"
            case .medium:
                return "ic_calendar_basic_preview-large"
            }
        case .halfOnHalf:
            switch size {
            case .small:
                return "ic_calendar_halfOnHalf_preview-small"
            case .medium:
                return "ic_calendar_halfOnHalf_preview-large"
            }
        case .simple:
            switch size {
            case .small:
                return "ic_calendar_simple_preview-small"
            case .medium:
                return "ic_calendar_simple_preview-large"
            }
        case .bigger:
            switch size {
            case .small:
                return "ic_calendar_bigger_preview-small"
            case .medium:
                return "ic_calendar_bigger_preview-large"
            }
        }
    }
}

#Preview {
    CalendarWidgets(type: .basic)
}
