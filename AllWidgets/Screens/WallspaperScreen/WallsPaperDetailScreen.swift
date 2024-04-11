//
//  WallsPaperDetailScreen.swift
//  AllWidgets
//
//  Created by ANTON DOBRYNIN on 10.04.2024.
//

import SwiftUI

struct WallsPaperDetailScreen: View {
    
    @State private var isImageSaved = false
    
    var imageName: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                
                VStack {
                    if isImageSaved {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .foregroundColor(.white)
                            .overlay(
                                HStack {
                                    Image("ic_wallspaper_savedImage")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .padding(.leading, 16)
                                        .padding(.vertical, 13)
                                    
                                    Text("Downloaded to photos")
                                        .foregroundStyle(Colors.main_active_border_color)
                                        .font(.system(size: 17, weight: .bold))
                                        .padding(.leading, 4)
                                        .padding(.vertical, 13)
                                    
                                    Spacer()
                                    
                                    Button {
                                        openGallery()
                                    } label: {
                                        Text("Open")
                                            .font(.system(size: 15, weight: .light))
                                            .foregroundColor(Colors.main_active_border_color)
                                            .padding(.trailing, 16)
                                            .padding(.vertical, 13)
                                    }
                                }
                            )
                            .animation(.easeInOut)
                            .padding(.top, 32)
                            .padding(.horizontal, 16)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                    withAnimation {
                                        isImageSaved.toggle()
                                    }
                                }
                            }
                    }
                    
                    Spacer()
                    
                    Button {
                        saveImageToDevice(imageName: imageName)
                    } label: {
                        Text("Save picture")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(Colors.main_active_border_color)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color.white)
                            .cornerRadius(14)
                            .padding(.horizontal, 16)
                    }
                }
                .padding(.bottom, 35)
            }
        }
        .edgesIgnoringSafeArea([.bottom])
    }
    
    private func saveImageToDevice(imageName: String) {
        guard let image = UIImage(named: imageName) else {
            return
        }
        
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        withAnimation {
            isImageSaved.toggle()
        }
    }
    
    private func openGallery() {
        if let url = URL(string: "photos-redirect://") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                print("Photos app is not installed.")
            }
        }
    }
}
