//
//  PhotoWidgets.swift
//  AllWidgets
//
//  Created by ANTON DOBRYNIN on 11.04.2024.
//

import SwiftUI

enum TypeOfPhotoWidget {
    case basic
    case halfOnHalf
    case simple
    case space
    case bigger
}

struct PhotoWidgets: View {
    
    enum SizeOfWidget {
        case small
        case medium
    }
    
    @Binding var type: TypeOfPhotoWidget
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
    
    private func getPreviewImage(type: TypeOfPhotoWidget, and size: SizeOfWidget) -> String {
        
        switch type {
        case .basic:
            switch size {
            case .small:
                return "ic_photo_basic_preview-small"
            case .medium:
                return "ic_photo_basic_preview-large"
            }
        case .halfOnHalf:
            switch size {
            case .small:
                return "ic_photo_halfOnHalf_preview-small"
            case .medium:
                return "ic_photo_halfOnHalf_preview-large"
            }
        case .simple:
            switch size {
            case .small:
                return "ic_photo_simple_preview-small"
            case .medium:
                return "ic_photo_simple_preview-large"
            }
        case .bigger:
            switch size {
            case .small:
                return "ic_photo_bigger_preview-small"
            case .medium:
                return "ic_photo_bigger_preview-large"
            }
        case .space:
            switch size {
            case .small:
                return "ic_photo_space_preview-small"
            case .medium:
                return "ic_photo_space_preview-large"
            }
        }
    }
}

#Preview {
    PhotoWidgets(type: .constant(.basic))
}

