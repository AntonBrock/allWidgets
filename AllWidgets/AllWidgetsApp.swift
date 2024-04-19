//
//  AllWidgetsApp.swift
//  AllWidgets
//
//  Created by ANTON DOBRYNIN on 10.04.2024.
//

import SwiftUI
import Combine
import PopupView

enum Route {
    case Launch
    case MainRoute
    case Onboarding
}

enum WidgetsSize: String {
    case small
    case medium
}

@main
struct AllWidgetsApp: App {

    enum SelectedWidgetPreview: String {
        case Clock
        case Calendar
        case Photo
    }
    
    @State private var selectionWidget = 0
    
    @State private var savedClockWidget: TypeOfClockWidget?
    @State private var savedCalendarWidget: TypeOfCalendarWidget?
    @State private var savedPhotoWidget: TypeOfPhotoWidget?

    @State private var isNeedToPresentWidgetPreviewPopUP: Bool = false
    
    @State private var selectedTab: Tab = .widgets
    
    @State private var selectedClockWidget: TypeOfClockWidget = .basic
    @State private var selectedCalendarWidget: TypeOfCalendarWidget = .basic
    @State private var selectedPhotoWidget: TypeOfPhotoWidget = .basic
    
    @State private var selectedSizeWidget: WidgetsSize = .small
    @State private var selectedWidgetPreview: SelectedWidgetPreview = .Clock
    
    @State var route: Route = .MainRoute
    
    var body: some Scene {
        WindowGroup {
            switch route {
            case .Launch:
                LaunchScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            withAnimation {
                                route = .Onboarding
                            }
                        }
                    }
            case .MainRoute:
                NavigationView {
                    VStack {
                        switch selectedTab {
                        case .wallpapers:
                            WallspaperScreen()
                                .navigationTitle("Wallpaper")
                        case .widgets:
                            WidgetsScreen(selectedWidgets: { clockWidget, calendarWidget, photoWidget in
                                
                                if let clockWidget = clockWidget {
                                    selectedClockWidget = clockWidget
                                    selectedWidgetPreview = .Clock
                                   
                                    withAnimation {
                                        isNeedToPresentWidgetPreviewPopUP.toggle()
                                    }
                                }
                                
                                if let calendarWidget = calendarWidget {
                                    selectedCalendarWidget = calendarWidget
                                    selectedWidgetPreview = .Calendar
                                    
                                    withAnimation {
                                        isNeedToPresentWidgetPreviewPopUP.toggle()
                                    }
                                }
                                
                                if let photoWidget = photoWidget {
                                    selectedPhotoWidget = photoWidget
                                    selectedWidgetPreview = .Photo
                                    
                                    withAnimation {
                                        isNeedToPresentWidgetPreviewPopUP.toggle()
                                    }
                                }
                            })
                                .navigationTitle("AllWidgets")
                        case .settings:
                            SettingsScreen()
                                .navigationTitle("Settings")
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .overlay(
                        TabBar(selectedTab: $selectedTab), alignment: .bottom
                    )
                    .onChange(of: isNeedToPresentWidgetPreviewPopUP) { _ in
                        withAnimation {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                selectionWidget = 0
                            }
                        }
                    }
                    .popup(isPresented: $isNeedToPresentWidgetPreviewPopUP) {
                        VStack {
                            VStack {
                                Text("Preview")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(Colors.main_nav_title_color)
                                    .font(.system(size: 17,weight: .bold))
                                
                                Spacer()
                                
                                TabView(selection: $selectionWidget) {
                                    ForEach(0..<2) { index in
                                        getPreviewImages(index: index)
                                            .tag(index)
                                    }
                                }
                                .tabViewStyle(.page(indexDisplayMode: .never))
                                
                                HStack(spacing: 30) {
                                    Button {
                                        if selectionWidget != 0 {
                                            withAnimation {
                                                selectionWidget -= 1
                                            }
                                        }
                                    } label: {
                                        Image("ic_preview_widget_to_the_left")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                    }
                                    .frame(maxHeight: .infinity, alignment: .bottom)
                                    .transition(.opacity)
                                    
                                    Button {
                                        if selectionWidget != 1 {
                                            withAnimation {
                                                selectionWidget += 1
                                            }
                                        }
                                    } label: {
                                        Image("ic_preview_widget_to_the_right")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                    }
                                    .frame(maxHeight: .infinity, alignment: .bottom)
                                    .transition(.opacity)
                                    
                                }
                                .frame(height: 24)
                                .padding(.top, -30)
                                
                                Spacer()
                                
                                Button {
                                    switch selectedWidgetPreview {
                                    case .Clock:
                                        saveSelectedSizeAndWidgetType(
                                            size: selectedSizeWidget.rawValue,
                                            type: selectedClockWidget.rawValue,
                                            widget: selectedWidgetPreview.rawValue
                                        )
                                        
                                        withAnimation {
                                            isNeedToPresentWidgetPreviewPopUP.toggle()
                                        }
                                    case .Calendar:
                                        saveSelectedSizeAndWidgetType(
                                            size: selectedSizeWidget.rawValue,
                                            type: selectedCalendarWidget.rawValue,
                                            widget: selectedWidgetPreview.rawValue
                                        )
                                        
                                        withAnimation {
                                            isNeedToPresentWidgetPreviewPopUP.toggle()
                                        }                                    
                                    case .Photo:
                                        saveSelectedSizeAndWidgetType(
                                            size: selectedSizeWidget.rawValue,
                                            type: selectedPhotoWidget.rawValue,
                                            widget: selectedWidgetPreview.rawValue
                                        )
                                        
                                        withAnimation {
                                            isNeedToPresentWidgetPreviewPopUP.toggle()
                                        }
                                    }
                                } label: {
                                    Text("Set widgets")
                                        .font(.system(size: 17, weight: .bold))
                                        .foregroundStyle(.white)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                }
                                .frame(height: 50)
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(
                                            colors: [
                                                Colors.main_dark_blue_color,
                                                Colors.main_blue_color
                                            ]
                                        ),
                                        startPoint: .bottomTrailing,
                                        endPoint: .topLeading
                                    )
                                    .cornerRadius(15)
                                )
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 16)

                        }
                        .frame(maxWidth: .infinity, maxHeight: 336, alignment: .center)
                        .background(.white)
                        .cornerRadius(14)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 16)
                        
//                        Если нужно будет контролировать размер выбранного Widget
//                        .onChange(of: selectionWidget) { newValue in
//                            selectedSizeWidget = newValue == 0 ? .small : .medium
//                        }
                        
                    } customize: {
                        $0.backgroundColor(.black.opacity(0.5))
                        .closeOnTapOutside(true)
                        .closeOnTap(false)
                    }
                }
            case .Onboarding:
                OnboardingScreen(onClose: {
                    route = .MainRoute
                })
            }
        }
    }
    
    @ViewBuilder
    private func getPreviewImages(index: Int) -> some View {
        VStack {
            Image(previewWidget(selectedWidgetPreview: selectedWidgetPreview,
                                selectedClockWidget: selectedClockWidget)[index])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(16)
                .shadow(color: Color(hex: "ccd0f8").opacity(0.6), radius: 10, x: 2, y: 10)
                .frame(maxWidth: .infinity, maxHeight: 158)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 10)
    }
    
    private func previewWidget(selectedWidgetPreview: SelectedWidgetPreview, selectedClockWidget: TypeOfClockWidget) -> [String] {
        switch selectedWidgetPreview {
        case .Clock:
            switch selectedClockWidget {
            case .basic: return ["ic_clock_basic_preview-small", "ic_clock_basic_preview-large"]
            case .halfOnHalf: return ["ic_clock_halfOnHalf_preview-small", "ic_clock_halfOnHalf_preview-large"]
            case .bigger: return ["ic_clock_bigger_preview-small", "ic_clock_bigger_preview-large"]
            case .red: return ["ic_clock_red_preview-small", "ic_clock_red_preview-large"]
            case .clear: return ["ic_clock_clear_preview-small", "ic_clock_clear_preview-large"]
            case .clearWhite: return ["ic_clock_clearWhite_preview-small", "ic_clock_clearWhite_preview-large"]
            }
        case .Calendar:
            switch selectedCalendarWidget {
            case .basic: return ["ic_calendar_basic_preview-small", "ic_calendar_basic_preview-large"]
            case .halfOnHalf: return ["ic_calendar_halfOnHalf_preview-small", "ic_calendar_halfOnHalf_preview-large"]
            case .simple: return ["ic_calendar_simple_preview-small", "ic_calendar_simple_preview-large"]
            case .bigger: return ["ic_calendar_bigger_preview-small", "ic_calendar_bigger_preview-large"]
            }
        case .Photo:
            switch selectedPhotoWidget {
            case .basic: return ["ic_photo_basic_preview-small", "ic_photo_basic_preview-large"]
            case .halfOnHalf: return ["ic_photo_halfOnHalf_preview-small", "ic_photo_halfOnHalf_preview-large"]
            case .simple: return ["ic_photo_simple_preview-small", "ic_photo_simple_preview-large"]
            case .space: return ["ic_photo_space_preview-small", "ic_photo_space_preview-large"]
            case .bigger: return ["ic_photo_bigger_preview-small", "ic_photo_bigger_preview-large"]
            case .car: return ["ic_photo_car_preview-small", "ic_photo_car_preview-large"]
            case .bitch: return ["ic_photo_bitch_preview-small", "ic_photo_bitch_preview-large"]
            case .london: return ["ic_photo_london_preview-small", "ic_photo_london_preview-large"]
            }
        }
    }
    
    private func saveSelectedSizeAndWidgetType(size: String, type: String, widget: String) {
        if let userDefaults = UserDefaults(suiteName: "group.allWidgets.AllWidgets") {
            var savedWidgets: [[String: Any]] = userDefaults.array(forKey: "savedWidget") as? [[String: Any]] ?? []

            let widgetDict: [String: Any] = ["id": savedWidgets.count + 1, "size": size, "type": type, "widget": widget]
            savedWidgets.append(widgetDict)
            userDefaults.set(savedWidgets, forKey: "savedWidget")
        }
    }
}
