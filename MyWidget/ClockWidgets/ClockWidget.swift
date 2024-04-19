//
//  ClockWidget.swift
//  AllWidgets
//
//  Created by ANTON DOBRYNIN on 13.04.2024.
//

import SwiftUI

struct ClockWidget: View {
    
    @Binding var date: Date
    @Binding var size: String?
    @Binding var type: String?
    
    var body: some View {
        VStack {
            switch type {
            case "basic":
                if size == "small" {
                    prepareViewForBasicSmall(date: date)
                } else {
                    prepareViewForBasicMedium(date: date)
                }
            case "halfOnHalf":
                if size == "small" {
                    prepareViewForHalfOnHalfSmall(date: date)
                } else {
                    prepareViewForHalfOnHalfMedium(date: date)
                }
            case "bigger":
                if size == "small" {
                    prepareViewForBiggerSmall(date: date)
                } else {
                    prepareViewForBiggerMedium(date: date)
                }
            case "red":
                if size == "small" {
                    prepareViewForRedSmall(date: date)
                } else {
                    prepareViewForRedMedium(date: date)
                }
            case "clear":
                if size == "small" {
                    prepareViewForClearSmall(date: date)
                } else {
                    prepareViewForClearMedium(date: date)
                }
            case "clearWhite":
                if size == "small" {
                    prepareViewForClearWhiteSmall(date: date)
                } else {
                    prepareViewForClearWhiteMedium(date: date)
                }
            default:
                if size == "small" {
                    prepareViewForBasicSmall(date: date)
                } else {
                    prepareViewForBasicMedium(date: date)
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.vertical, 33)
        .padding(.horizontal, 16)
    }
    
    
    // MARK: - Basic
    // Small Widget
    @ViewBuilder
    func prepareViewForBasicSmall(date: Date) -> some View {
        var formattedDateForTitle: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM dd"
            return dateFormatter.string(from: date)
        }
        
        var formattedDateForSubTitle: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE"
            return dateFormatter.string(from: date)
        }
        
        var formattedHour: String {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.hour], from: date)
            return String(format: "%02d", components.hour ?? 0) // Добавляем ведущий ноль, если часы < 10
        }
        
        var formattedMinute: String {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.minute], from: date)
            return String(format: "%02d", components.minute ?? 0) // Добавляем ведущий ноль, если минуты < 10
        }

        VStack(spacing: 0) {
            Text(formattedDateForTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.white)
                .font(.system(size: 16, weight: .bold))
            
            HStack(spacing: 8) {
                RoundedRectangle(cornerRadius: 9)
                    .fill(.white)
                    .frame(width: 56, height: 56)
                    .overlay(
                        Text(formattedHour)
                            .foregroundColor(Colors.main_active_border_color)
                            .font(.system(size: 26, weight: .bold))
                    )
                
                RoundedRectangle(cornerRadius: 0)
                    .fill(.clear)
                    .frame(width: 6, height: 10)
                    .overlay(
                        Text(":")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .bold))
                    )
                
                RoundedRectangle(cornerRadius: 9)
                    .fill(.white)
                    .frame(width: 56, height: 56)
                    .overlay(
                        Text(formattedMinute)
                            .foregroundColor(Colors.main_active_border_color)
                            .font(.system(size: 26, weight: .bold))
                    )
            }
            .padding(.top, 8)
            
            Text(formattedDateForSubTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.white)
                .font(.system(size: 16, weight: .bold))
                .padding(.top, 8)
            
        }
    }
    
    // Medium Widget
    @ViewBuilder
    func prepareViewForBasicMedium(date: Date) -> some View {
        var formattedDateForTitle: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd yyyy"
            return dateFormatter.string(from: date)
        }
        
        var formattedDateForSubTitle: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEE"
            return dateFormatter.string(from: date)
        }
        
        var formattedHour: String {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.hour], from: date)
            return String(format: "%02d", components.hour ?? 0) // Добавляем ведущий ноль, если часы < 10
        }
        
        var formattedMinute: String {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.minute], from: date)
            return String(format: "%02d", components.minute ?? 0) // Добавляем ведущий ноль, если минуты < 10
        }

        HStack(spacing: 16) {
            HStack(spacing: 8) {
                RoundedRectangle(cornerRadius: 9)
                    .fill(.white)
                    .frame(width: 93, height: 88)
                    .overlay(
                        Text(formattedHour)
                            .foregroundColor(Colors.main_active_border_color)
                            .font(.system(size: 46, weight: .bold))
                    )
                
                RoundedRectangle(cornerRadius: 0)
                    .fill(.clear)
                    .frame(width: 15, height: 20)
                    .overlay(
                        Text(":")
                            .foregroundColor(.white)
                            .font(.system(size: 40, weight: .bold))
                    )
                
                RoundedRectangle(cornerRadius: 9)
                    .fill(.white)
                    .frame(width: 93, height: 88)
                    .overlay(
                        Text(formattedMinute)
                            .foregroundColor(Colors.main_active_border_color)
                            .font(.system(size: 46, weight: .bold))
                    )
            }
            .padding(.top, 8)
            
            VStack(spacing: 10) {
                
                RoundedRectangle(cornerRadius: 9)
                    .fill(.white)
                    .frame(maxWidth: 109, maxHeight: 28)
                    .overlay(
                        Text(formattedDateForSubTitle)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(Colors.main_active_border_color)
                            .font(.system(size: 16, weight: .bold))
                        
                    )
                
                RoundedRectangle(cornerRadius: 9)
                    .fill(.white)
                    .frame(maxWidth: 109, maxHeight: 50)
                    .overlay(
                        Text(formattedDateForTitle)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(Colors.main_active_border_color)
                            .font(.system(size: 16, weight: .bold))
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                    )
            }
            .padding(.top, 6)
        }
    }
    
    // MARK: - HalfOnHalf
    @ViewBuilder
    func prepareViewForHalfOnHalfSmall(date: Date) -> some View {
        var formattedDateForTitle: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd'\n'YYYY"
            return dateFormatter.string(from: date)
        }
        
        var formattedDateTime: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "h:mm'\n'a"
            return dateFormatter.string(from: date)
        }
        
        var formattedDateForSubTitle: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE"
            return dateFormatter.string(from: date)
        }

        VStack(spacing: 0) {
            VStack {
                Text(formattedDateForTitle)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                    .padding(.bottom, 5)
            }
            
            Spacer()
            
            VStack {
                Text(formattedDateTime)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .foregroundColor(Colors.time_dark_color)
                    .font(.system(size: 26, weight: .bold))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
            }
            .padding(.top, 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
    
    @ViewBuilder
    func prepareViewForHalfOnHalfMedium(date: Date) -> some View {
        var formattedDateForTitle: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd'\n'YYYY"
            return dateFormatter.string(from: date)
        }
        
        var formattedDateTime: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "h:mm"
            return dateFormatter.string(from: date)
        }
        
        var formattedDateTimeSection: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "a"
            return dateFormatter.string(from: date)
        }
       
        var formattedDateForSubTitle: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE"
            return dateFormatter.string(from: date)
        }
        
        HStack(spacing: 0) {
            Text(formattedDateForTitle)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(2)
                .padding(.leading, 10)
            
            Spacer()
            
            VStack(spacing: 0) {
                Text(formattedDateTime)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .foregroundColor(Colors.time_dark_color)
                    .font(.system(size: 36, weight: .bold))
                    .fixedSize(horizontal: false, vertical: true)
                
                Text(formattedDateTimeSection)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .foregroundColor(Colors.time_dark_color)
                    .font(.system(size: 20, weight: .bold))
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.leading, -40)
        }
    }
    
    // MARK: - Bigger
    @ViewBuilder
    func prepareViewForBiggerSmall(date: Date) -> some View {
        var formattedDateTime: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            return dateFormatter.string(from: date)
        }
        
        var formattedDateTimeZone: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "a"
            return dateFormatter.string(from: date)
        }
        var formattedDateDay: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMdd"
            return dateFormatter.string(from: date)
        }
        var formattedDateYear: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY"
            return dateFormatter.string(from: date)
        }

        VStack(spacing: 0) {
            Text(formattedDateTime)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .foregroundColor(.white)
                .font(.system(size: 32, weight: .bold))
                .fixedSize(horizontal: true, vertical: true)
                .padding(.bottom, 5)
            
            HStack(spacing: 12) {
                Text(formattedDateTimeZone)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
                    .fixedSize(horizontal: true, vertical: true)
                    .textCase(.uppercase)
                
                Text(formattedDateDay)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
                    .fixedSize(horizontal: true, vertical: true)
                    .textCase(.uppercase)
                
                Text(formattedDateYear)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
                    .fixedSize(horizontal: true , vertical: true)
                    .textCase(.uppercase)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }

    func prepareViewForBiggerMedium(date: Date) -> some View {
        var formattedDateTime: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            return dateFormatter.string(from: date)
        }
        
        var formattedDateTimeZone: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "a"
            return dateFormatter.string(from: date)
        }
        var formattedDateDay: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMdd"
            return dateFormatter.string(from: date)
        }
        var formattedDateYear: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY"
            return dateFormatter.string(from: date)
        }

        return VStack(spacing: 0) {
            Text(formattedDateTime)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .foregroundColor(.white)
                .font(.system(size: 48, weight: .bold))
                .fixedSize(horizontal: true, vertical: true)
                .padding(.bottom, 5)
            
            HStack(spacing: 12) {
                Text(formattedDateTimeZone)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .fixedSize(horizontal: true, vertical: true)
                    .textCase(.uppercase)
                
                Text(formattedDateDay)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .fixedSize(horizontal: true, vertical: true)
                    .textCase(.uppercase)
                
                Text(formattedDateYear)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .fixedSize(horizontal: true , vertical: true)
                    .textCase(.uppercase)
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
    
    // MARK: - Red
    @ViewBuilder
    func prepareViewForRedSmall(date: Date) -> some View {
        var formattedDateTime: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            return dateFormatter.string(from: date)
        }
        
        var formattedDateDay: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.YYYY"
            return dateFormatter.string(from: date)
        }
        
        VStack(spacing: 0) {
            Text(formattedDateTime)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .foregroundColor(.white)
                .font(.system(size: 32, weight: .bold))
                .fixedSize(horizontal: true, vertical: true)
                .padding(.bottom, 5)
            
            HStack(spacing: 12) {
                Text(formattedDateDay)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .bold))
                    .fixedSize(horizontal: true, vertical: true)
                    .textCase(.uppercase)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
    
    @ViewBuilder
    func prepareViewForRedMedium(date: Date) -> some View {
        var formattedDateTime: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            return dateFormatter.string(from: date)
        }
        
        var formattedDateDay: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.YYYY"
            return dateFormatter.string(from: date)
        }
        
        VStack(spacing: 0) {
            Text(formattedDateTime)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .foregroundColor(.white)
                .font(.system(size: 36, weight: .bold))
                .fixedSize(horizontal: true, vertical: true)
                .padding(.bottom, 5)
            
            HStack(spacing: 12) {
                Text(formattedDateDay)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
                    .fixedSize(horizontal: true, vertical: true)
                    .textCase(.uppercase)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
    
    // MARK: - Clear
    @ViewBuilder
    func prepareViewForClearSmall(date: Date) -> some View {
        var formattedDateTime: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            return dateFormatter.string(from: date)
        }
        
        var formattedDateDay: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.YYYY"
            return dateFormatter.string(from: date)
        }
        
        VStack(spacing: 0) {
            Text(formattedDateTime)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .foregroundColor(.white)
                .font(.system(size: 32, weight: .bold))
                .fixedSize(horizontal: true, vertical: true)
                .padding(.bottom, 5)
            
            HStack(spacing: 12) {
                Text(formattedDateDay)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .bold))
                    .fixedSize(horizontal: true, vertical: true)
                    .textCase(.uppercase)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
    
    @ViewBuilder
    func prepareViewForClearMedium(date: Date) -> some View {
        var formattedDateTime: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            return dateFormatter.string(from: date)
        }
        
        var formattedDateDay: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.YYYY"
            return dateFormatter.string(from: date)
        }
        
        VStack(spacing: 0) {
            Text(formattedDateTime)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .foregroundColor(.white)
                .font(.system(size: 55, weight: .bold))
                .fixedSize(horizontal: true, vertical: true)
                .padding(.bottom, 5)
            
            HStack(spacing: 12) {
                Text(formattedDateDay)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .bold))
                    .fixedSize(horizontal: true, vertical: true)
                    .textCase(.uppercase)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
    
    // MARK: - ClearWhite
    @ViewBuilder
    func prepareViewForClearWhiteSmall(date: Date) -> some View {
        var formattedDateTime: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            return dateFormatter.string(from: date)
        }
        
        var formattedDateDay: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.YYYY"
            return dateFormatter.string(from: date)
        }
        
        VStack(spacing: 0) {
            Text(formattedDateTime)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .foregroundColor(Color(hex: "#4A4C61"))
                .font(.system(size: 32, weight: .bold))
                .fixedSize(horizontal: true, vertical: true)
                .padding(.bottom, 5)
            
            HStack(spacing: 12) {
                Text(formattedDateDay)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .foregroundColor(Color(hex: "#4A4C61"))
                    .font(.system(size: 16, weight: .bold))
                    .fixedSize(horizontal: true, vertical: true)
                    .textCase(.uppercase)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
    
    @ViewBuilder
    func prepareViewForClearWhiteMedium(date: Date) -> some View {
        var formattedDateTime: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            return dateFormatter.string(from: date)
        }
        
        var formattedDateDay: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.YYYY"
            return dateFormatter.string(from: date)
        }
        
        VStack(spacing: 0) {
            Text(formattedDateTime)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .foregroundColor(Color(hex: "#4A4C61"))
                .font(.system(size: 55, weight: .bold))
                .fixedSize(horizontal: true, vertical: true)
                .padding(.bottom, 5)
            
            HStack(spacing: 12) {
                Text(formattedDateDay)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .foregroundColor(Color(hex: "#4A4C61"))
                    .font(.system(size: 25, weight: .bold))
                    .fixedSize(horizontal: true, vertical: true)
                    .textCase(.uppercase)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
    
}
