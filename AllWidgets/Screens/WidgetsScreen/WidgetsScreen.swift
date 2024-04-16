//
//  WidgetsScreen.swift
//  AllWidgets
//
//  Created by ANTON DOBRYNIN on 11.04.2024.
//

import SwiftUI
import PopupView

struct WidgetsScreen: View {
    
    enum TypeOfWidgets {
        case close
        case calendar
        case photo
        case progress
        case step
    }
    
    @State var selectedWidgets: (_ :TypeOfClockWidget?, _ :TypeOfCalendarWidget?, _: TypeOfPhotoWidget?) -> Void
    
    @State private var selectedSegment = 0
    @State private var selectedTypeOfClockWidget: TypeOfClockWidget = .basic
    @State private var selectedTypeOfCalendarWidget: TypeOfCalendarWidget = .basic
    @State private var selectedTypeOfPhotoWidget: TypeOfPhotoWidget = .basic
    
    @State private var savedWidgetsFromStorage: [[String: Any]] = [[:]]


    var body: some View {
        ScrollView(.vertical) {
            VStack {
                HStack {
                    VStack {
                        Text("Widgets")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Colors.dark_text_color)
                            .font(.system(size: 34, weight: .bold))
                            .padding(.top, -40)
                        
                        HStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(selectedSegment == 0 ? Colors.main_active_border_color : Colors.light_gray_color.opacity(0.07))
                                .frame(width: 110, height: 28)
                                .overlay {
                                    Text("All widgets")
                                        .font(.system(size: 15, weight: .bold))
                                        .foregroundStyle(selectedSegment == 0 ? .white : Colors.main_active_border_color)
                                }
                                .onTapGesture {
                                    withAnimation {
                                        selectedSegment = 0
                                    }
                                }
                            
                            RoundedRectangle(cornerRadius: 20)
                                .fill(selectedSegment == 1 ? Colors.main_active_border_color : Colors.light_gray_color.opacity(0.07) )
                                .frame(width: 110, height: 28)
                                .overlay {
                                    Text("My widgets")
                                        .font(.system(size: 15, weight: .bold))
                                        .foregroundStyle(selectedSegment == 1 ? .white :  Colors.main_active_border_color)
                                }
                                .onTapGesture {
                                    withAnimation {
                                        selectedSegment = 1
                                    }
                                }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, -10)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: OnboardingScreen(onClose: {
                        print("1")
                    })) {
                        RoundedRectangle(cornerRadius: 77 / 2)
                            .fill(Colors.light_gray_color.opacity(0.07))
                            .frame(width: 77, height: 77)
                            .overlay {
                                Image("ic_widgets_quastion")
                                    .resizable()
                                    .frame(width: 25, height: 35)
                            }
                    }
                }
                .padding(.top, 16)
                
                Spacer()
                
                VStack {
                    if selectedSegment == 0 {
                        configureTypesWidgets()
                    } else {
                        configrureSavedWidgets(savedWidgets: savedWidgetsFromStorage)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onAppear {
                    getSavedWidgets()
                }
            }
            .onChange(of: selectedSegment) { newValue in
                if newValue == 1 {
                    getSavedWidgets()
                }
            }
        }
        .scrollIndicators(.hidden)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 16)
        .padding(.bottom, 90)
    }
    
    private func getSavedWidgets() {
        if let userDefaults = UserDefaults(suiteName: "group.allWidgets.AllWidgets") {
            if let savedWidgets = userDefaults.array(forKey: "savedWidget") as? [[String: Any]] {
                self.savedWidgetsFromStorage = savedWidgets
                
                let sorted = self.savedWidgetsFromStorage.sorted { ($0["id"] as? Int ?? 0) < ($1["id"] as? Int ?? 0) }
                self.savedWidgetsFromStorage = sorted
            }
        }
    }
    
    // MARK: - Set Widget
    @ViewBuilder
    private func configureTypesWidgets() -> some View {
        VStack {
            // Clock Widget
            VStack {
                HStack {
                    Text("Clock \(getSelectedClockNumberWidget())")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundStyle(Colors.dark_text_color)

                    Button(action: {
                        withAnimation {
                            selectedWidgets(selectedTypeOfClockWidget, nil, nil)
                        }
                    }, label: {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Colors.main_active_border_color)
                            .frame(width: 41, height: 26)
                            .overlay {
                                Text("Set")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 13, weight: .bold))
                            }
                    })
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                ZStack {
                    PlaceholderCardView(color: Color(hex: "ccd0f8"))
                        .offset(x: 0, y: -40)
                        .scaleEffect(-0.90)
                        .padding(.horizontal, 16)

                    PlaceholderCardView(color: Color(hex: "ccd0f8"))
                        .offset(x: 0, y: -20)
                        .scaleEffect(-0.95)
                        .padding(.horizontal, 16)
                    
                    ClockWidgets(type: selectedTypeOfClockWidget, size: .medium)
                        .id(selectedTypeOfClockWidget)
                        .onTapGesture {
                            nextTypeOfClockWidget()
                        }
                }
                .offset(x: 0, y: 0)
                .padding(.top, -20)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            // Photo Widget
            VStack {
                HStack {
                    Text("Photo \(getSelectedPhotoNumberWidget())")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundStyle(Colors.dark_text_color)

                    Button(action: {
                        withAnimation {
                            selectedWidgets(nil, nil, selectedTypeOfPhotoWidget)
                        }
                    }, label: {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Colors.main_active_border_color)
                            .frame(width: 41, height: 26)
                            .overlay {
                                Text("Set")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 13, weight: .bold))
                            }
                    })
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                ZStack {
                    PlaceholderCardView(color: Color(hex: "ccd0f8"))
                        .offset(x: 0, y: -40)
                        .scaleEffect(-0.90)
                        .padding(.horizontal, 16)

                    PlaceholderCardView(color: Color(hex: "ccd0f8"))
                        .offset(x: 0, y: -20)
                        .scaleEffect(-0.95)
                        .padding(.horizontal, 16)
                    
                    PhotoWidgets(type: selectedTypeOfPhotoWidget, size: .medium)
                        .id(selectedTypeOfPhotoWidget)
                        .onTapGesture {
                            nextTypeOfPhotoWidget()
                        }
                }
                .offset(x: 0, y: 0)
                .padding(.top, -20)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 32)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    // MARK: - Get Saved Widgets
    @ViewBuilder
    private func configrureSavedWidgets(savedWidgets: [[String: Any]]) -> some View {
        VStack {
            if savedWidgets.isEmpty {
                Text("Not saved any widgets. Let's add some!")
                    .foregroundStyle(Colors.main_dark_gray_color)
                    .font(.system(size: 17, weight: .semibold))
                    .padding(.top, 26)
            } else {
                ForEach(savedWidgets.indices, id: \.self) { index in
                    VStack {
                        HStack {
                            Text("\(savedWidgets[index]["widget"] as? String ?? "") \(savedWidgets[index]["widget"] as? String ?? "" == "Clock" ? getSelectedClockNumberWidget(TypeOfClockWidget(rawValue: savedWidgets[index]["type"] as? String ?? "") ?? .bigger) : savedWidgets[index]["widget"] as? String ?? "" == "Calendar" ? getSelectedCalendarNumberWidget(TypeOfCalendarWidget(rawValue: savedWidgets[index]["type"] as? String ?? "") ?? .basic) : getSelectedPhotoNumberWidget(TypeOfPhotoWidget(rawValue: savedWidgets[index]["type"] as? String ?? "") ?? .basic))")
                                .font(.system(size: 17, weight: .bold))
                                .foregroundStyle(Colors.dark_text_color)
                            
                            Button(action: {
                                deleteItem(index: index)
                            }, label: {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Colors.main_active_border_color)
                                    .frame(width: 61, height: 26)
                                    .overlay {
                                        Text("DELETE")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 13, weight: .bold))
                                    }
                            })
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack {
                            if let widget = savedWidgetsFromStorage[index]["widget"] as? String {
                                switch widget {
                                case "Clock":
                                    ClockWidgets(
                                        type: TypeOfClockWidget(rawValue: savedWidgets[index]["type"] as? String ?? "") ?? .bigger,
                                        size: ClockWidgets.SizeOfWidget(rawValue: savedWidgets[index]["size"] as? String ?? "") ?? .medium
                                    )
//                                case "Calendar":
//                                    CalendarWidgets(
//                                        type: TypeOfCalendarWidget(rawValue: savedWidgets[index]["type"] as? String ?? "") ?? .basic,
//                                        size: CalendarWidgets.SizeOfWidget(rawValue: savedWidgets[index]["size"] as? String ?? "") ?? .medium
//                                    )
                                default:
                                    PhotoWidgets(
                                        type: TypeOfPhotoWidget(rawValue: savedWidgets[index]["type"] as? String ?? "") ?? .basic,
                                        size: PhotoWidgets.SizeOfWidget(rawValue: savedWidgets[index]["size"] as? String ?? "") ?? .medium
                                    )
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .frame(maxHeight: .infinity)
    }
    
    private func deleteItem(index: Int) {
        savedWidgetsFromStorage.remove(at: index)
        
        if let userDefaults = UserDefaults(suiteName: "group.allWidgets.AllWidgets") {
            var savedWidgets: [[String: Any]] = userDefaults.array(forKey: "savedWidget") as? [[String: Any]] ?? []

            savedWidgets = savedWidgetsFromStorage
            userDefaults.set(savedWidgets, forKey: "savedWidget")
        }
    }
    
    private func nextTypeOfClockWidget() {
        switch selectedTypeOfClockWidget {
        case .basic:
            selectedTypeOfClockWidget = .halfOnHalf
        case .halfOnHalf:
            selectedTypeOfClockWidget = .simple
        case .simple:
            selectedTypeOfClockWidget = .bigger
        case .bigger:
            selectedTypeOfClockWidget = .basic
        }
    }
    
    private func nextTypeOfCalendarkWidget() {
        switch selectedTypeOfCalendarWidget {
        case .basic:
            selectedTypeOfCalendarWidget = .halfOnHalf
        case .halfOnHalf:
            selectedTypeOfCalendarWidget = .simple
        case .simple:
            selectedTypeOfCalendarWidget = .bigger
        case .bigger:
            selectedTypeOfCalendarWidget = .basic
        }
    }
    
    private func nextTypeOfPhotoWidget() {
        switch selectedTypeOfPhotoWidget {
        case .basic:
            selectedTypeOfPhotoWidget = .halfOnHalf
        case .halfOnHalf:
            selectedTypeOfPhotoWidget = .simple
        case .simple:
            selectedTypeOfPhotoWidget = .bigger
        case .bigger:
            selectedTypeOfPhotoWidget = .space
        case .space:
            selectedTypeOfPhotoWidget = .basic
        }
    }
    
    private func getSelectedClockNumberWidget(_ type: TypeOfClockWidget? = nil) -> Int {
        if type == nil {
            switch selectedTypeOfClockWidget {
            case .basic: return 1
            case .halfOnHalf: return 2
            case .simple: return 3
            case .bigger: return 4
            }
        } else {
            switch type {
            case .basic: return 1
            case .halfOnHalf: return 2
            case .simple: return 3
            case .bigger: return 4
            case .none: return 0
            }
        }
    }
    
    private func getSelectedCalendarNumberWidget(_ type: TypeOfCalendarWidget? = nil) -> Int {
        if type == nil {
            switch selectedTypeOfCalendarWidget {
            case .basic: return 1
            case .halfOnHalf: return 2
            case .simple: return 3
            case .bigger: return 4
            }
        } else {
            switch type {
            case .basic: return 1
            case .halfOnHalf: return 2
            case .simple: return 3
            case .bigger: return 4
            case .none: return 0
            }
        }
    }
    
    private func getSelectedPhotoNumberWidget(_ type: TypeOfPhotoWidget? = nil) -> Int {
        if type == nil {
            switch selectedTypeOfPhotoWidget {
            case .basic: return 1
            case .halfOnHalf: return 2
            case .simple: return 3
            case .bigger: return 4
            case .space: return 5
            }
        } else {
            switch type {
            case .basic: return 1
            case .halfOnHalf: return 2
            case .simple: return 3
            case .bigger: return 4
            case .space: return 5
            case .none:
                return 0
            }
        }
      
    }
}

struct PlaceholderCardView : View {
    let color: Color

    var body: some View {
        ZStack {
            Rectangle()
                .fill(color)
                .cornerRadius(16)
                .frame(maxWidth: .infinity, minHeight: 158, maxHeight: 158)
                .padding(.top, 16)
        }
        .shadow(radius: 6)
    }
}

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
