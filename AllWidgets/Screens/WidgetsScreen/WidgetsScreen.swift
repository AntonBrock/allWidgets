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
    
    @Binding var isNeedToPresentWidgetPreviewPopUP: Bool
    
    @State private var selectedSegment = 0
    @State private var selectedTypeOfClockWidget: TypeOfClockWidget = .basic
    @State private var selectedTypeOfCalendarWidget: TypeOfCalendarWidget = .basic
    @State private var selectedTypeOfPhotoWidget: TypeOfPhotoWidget = .basic
    
//    @State var cards: [ExampleCardView] = [ExampleCardView(index: 0), ExampleCardView(index: 1), ExampleCardView(index: 3)]

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
                        Text("Segment 2 ")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .scrollIndicators(.hidden)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 16)
        .padding(.bottom, 90)
    }
    
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
                            isNeedToPresentWidgetPreviewPopUP.toggle()
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
                
                ClockWidgets(type: $selectedTypeOfClockWidget, size: .medium)
                    .onTapGesture {
                        nextTypeOfClockWidget()
                    }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // Calendar Widget
            VStack {
                HStack {
                    Text("Calendar \(getSelectedCalendarNumberWidget())")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundStyle(Colors.dark_text_color)

                    Button(action: {
                        print("set")
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
                
                CalendarWidgets(type: $selectedTypeOfCalendarWidget, size: .medium)
                    .onTapGesture {
                        nextTypeOfCalendarkWidget()
                    }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // Photo Widget
            VStack {
                HStack {
                    Text("Photo \(getSelectedPhotoNumberWidget())")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundStyle(Colors.dark_text_color)

                    Button(action: {
                        print("set")
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
                
                PhotoWidgets(type: $selectedTypeOfPhotoWidget, size: .medium)
                    .onTapGesture {
                        nextTypeOfPhotoWidget()
                    }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
    
    private func getSelectedClockNumberWidget() -> Int {
        switch selectedTypeOfClockWidget {
        case .basic: return 1
        case .halfOnHalf: return 2
        case .simple: return 3
        case .bigger: return 4
        }
    }
    
    private func getSelectedCalendarNumberWidget() -> Int {
        switch selectedTypeOfCalendarWidget {
        case .basic: return 1
        case .halfOnHalf: return 2
        case .simple: return 3
        case .bigger: return 4
        }
    }
    
    private func getSelectedPhotoNumberWidget() -> Int {
        switch selectedTypeOfPhotoWidget {
        case .basic: return 1
        case .halfOnHalf: return 2
        case .simple: return 3
        case .space: return 4
        case .bigger: return 5
        }
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

//struct ExampleCardView: View {
//    var index: Int
//    var tagId: UUID = UUID()
//
//    var body: some View {
//
//        RoundedRectangle(cornerRadius: 20)
//            .fill(Color.white)
//            .overlay(
//                VStack(spacing: 10) {
//                    Image(systemName: "heart.fill")
//                        .font(.system(size: 50))
//                        .foregroundColor(.pink)
//                    Text("Example Card \(index)")
//                        .font(.title)
//                        .bold()
//                    Text("This is an example card with some beautiful UI.")
//                        .multilineTextAlignment(.center)
//                        .font(.body)
//                        .foregroundColor(.gray)
//                }
//                .padding()
//            )
//            .frame(maxWidth: .infinity, minHeight: 158, maxHeight: 158)
//            .shadow(color: .gray, radius: 5)
//            .offset(y: index == 0 ? 30 : index == 1 ? 15 : index == 2 ? 10 : 0)
//    }
//}
