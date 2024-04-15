//
//  WallspaperScreen.swift
//  AllWidgets
//
//  Created by ANTON DOBRYNIN on 10.04.2024.
//

import SwiftUI

struct WallspaperScreen: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8)
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(0..<8) { index in
                        NavigationLink(destination: WallsPaperDetailScreen(imageName: navigateToDetailScreen(index: index))) {
                            PhotoView(index: index, size: photoSizeForIndex(index, containerSize: geometry.size))
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                                .padding(.top, index == 2 ? -40 : index == 4 ? -30 : index == 6 ? -20 : 0)
                        }
                    }
                }
                .padding(10)
                .padding(.bottom, 80)
            }
            .scrollIndicators(.hidden)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.horizontal, 16)
    }
    
    func photoSizeForIndex(_ index: Int, containerSize: CGSize) -> CGSize {
        switch index {
        case 0:
            return CGSize(width: containerSize.width / 2 - 12, height: 310)
        case 1:
            return CGSize(width: containerSize.width / 2 - 12, height: 350)
        case 2:
            return  CGSize(width: containerSize.width / 2 - 12, height: 360)
        case 3:
            return CGSize(width: containerSize.width / 2 - 12, height: 350)
        case 4:
            return  CGSize(width: containerSize.width / 2 - 12, height: 360)
        case 5:
            return CGSize(width: containerSize.width / 2 - 12, height: 350)
        case 6:
            return CGSize(width: containerSize.width / 2 - 12, height: 360)
        case 7:
            return  CGSize(width: containerSize.width / 2 - 12, height: 360)
        default:
            return CGSize(width: containerSize.width / 2 - 12, height: 310)
        }
    }
    
    func navigateToDetailScreen(index: Int) -> String {
        
        switch index {
        case 0:
            return "wallspaper_image_one"
        case 1:
            return "wallspaper_image_two"
        case 2:
            return "wallspaper_image_three"
        case 3:
            return "wallspaper_image_four"
        case 4:
            return "wallspaper_image_five"
        case 5:
            return "wallspaper_image_six"
        case 6:
            return "wallspaper_image_seven"
        case 7:
            return "wallspaper_image_eight"
        default:
            return ""
        }
    }
}

struct PhotoView: View {
    var index: Int
    var size: CGSize
    
    var body: some View {
        Image(
            index == 0
            ? "wallspaper_image_one"
            : index == 1
            ? "wallspaper_image_two"
            : index == 2
            ? "wallspaper_image_three"
            : index == 3
            ? "wallspaper_image_four"
            : index == 4 
            ? "wallspaper_image_five"
            : index == 5
            ? "wallspaper_image_six"
            : index == 6
            ? "wallspaper_image_seven"
            : index == 7
            ? "wallspaper_image_eight"
            : "wallspaper_image_eight"
        )
            .resizable()
            .scaledToFill()
            .frame(width: size.width, height: size.height)
            .cornerRadius(14)
    }
}
