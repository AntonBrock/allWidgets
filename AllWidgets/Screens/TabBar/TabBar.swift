//
//  TabBar.swift
//  AllWidgets
//
//  Created by ANTON DOBRYNIN on 10.04.2024.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case wallpapers
    case widgets
    case settings
}

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    let screenWidth = UIScreen.main.bounds.size.width
    var tabs: [Tab] = [.wallpapers, .widgets, .settings]
    
    var iconNameForTab: [Tab: String] = [
        .wallpapers: "ic_tab_wallspaper",
        .widgets: "ic_tab_widgets",
        .settings: "ic_tab_setting"
    ]
    
    var titleTab: [Tab: String] = [
        .wallpapers: "Wallpapers",
        .widgets: "Widgets",
        .settings: "Settings"
    ]
    
    var selectedIconNameForTab: [Tab: String] = [
        .wallpapers: "ic_tab_wallspaper-fill",
        .widgets: "ic_tab_widgets-fill",
        .settings: "ic_tab_setting-fill"
    ]
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                ForEach(tabs, id: \.self) { tab in
                    VStack {
                        Image(tab == selectedTab ? selectedIconNameForTab[tab]! : iconNameForTab[tab]!)
                            .resizable()
                            .frame(width: 38, height: 26)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.1)) {
                                    selectedTab = tab
                                }
                            }
                        
                        Text(titleTab[tab]!)
                            .font(.system(size: 10, weight: .medium))
                            .foregroundStyle(tab == selectedTab ? Colors.main_blue_color : Colors.main_gray_color)
                    }
                    .padding()
                    
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .padding(.bottom, screenWidth < 375 ? 15 : 45)
            .padding(.top, -10)
        }
        .background(.white)
        .frame(maxWidth: .infinity, maxHeight: 30)
    }
}
