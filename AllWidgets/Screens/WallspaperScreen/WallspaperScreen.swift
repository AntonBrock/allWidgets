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
                    ForEach(0..<4) { index in
                        NavigationLink(destination: WallsPaperDetailScreen(imageName: navigateToDetailScreen(index: index))) {
                            PhotoView(index: index, size: photoSizeForIndex(index, containerSize: geometry.size))
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                                .padding(.top, index == 2 ? -40 : 0)
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
        default:
            return ""
        }
    }
}

struct PhotoView: View {
    var index: Int
    var size: CGSize
    
    var body: some View {
        Image(index == 0 ? "wallspaper_image_one" : index == 1 ? "wallspaper_image_two" : index == 2 ? "wallspaper_image_three" : "wallspaper_image_four")
            .resizable()
            .scaledToFill()
            .frame(width: size.width, height: size.height)
            .cornerRadius(14)
    }
}
