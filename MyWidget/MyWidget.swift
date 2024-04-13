//
//  MyWidget.swift
//  MyWidget
//
//  Created by ANTON DOBRYNIN on 13.04.2024.
//

import WidgetKit
import SwiftUI
import Intents

struct MyWidgetEntry: TimelineEntry {
    let date: Date
    let id: String?
    let widget: String?
    let size: String?
    let type: String?
    let myText: String
}

struct MyWidgetView: View {
    
    let entry: MyWidgetEntry
    
    var body: some View {
        VStack {
            if entry.widget == nil {
                Text(entry.myText)
                    .font(.subheadline.weight(.light))
            } else {
                switch entry.widget {
                case "Clock": 
                    ClockWidget(date: entry.date, size: entry.size ?? "0", type: entry.type ?? "basic")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                case "Calendar": Text("Calendar")
                case "Photo": Text("Photo")
                default:
                    Text(entry.myText)
                        .font(.subheadline.weight(.light))
                }
            }
        }
        .containerBackground(for: .widget) {
            switch entry.type {
            case "basic": Colors.main_active_border_color.opacity(0.3)
            case "halfOnHalf":
                if entry.size == "small" {
                    VStack(spacing: 0) {
                        LinearGradient(
                            gradient: Gradient(colors: [Color(hex: "777A93"), Color(hex: "262738")]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .edgesIgnoringSafeArea(.all)
                        
                        Color.white
                    }
                } else {
                    HStack(spacing: 0) {
                        LinearGradient(
                            gradient: Gradient(colors: [Color(hex: "777A93"), Color(hex: "262738")]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .frame(maxWidth: 120)
                        
                        Color.white
                    }
                }
            default: Color.white
            }
        }
    }
}

struct MyWidgetTimelineProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> MyWidgetEntry {
        return MyWidgetEntry(date: Date(), id: nil, widget: nil, size: nil, type: nil, myText: "AllWidgets")
    }

    func getSnapshot(for configuration: MyWidgetConfigurationIntent,
                     in context: Context,
                     completion: @escaping (MyWidgetEntry) -> ()) {
        
        let entry = MyWidgetEntry(
            date: Date(),
            id: nil,
            widget: nil,
            size: nil,
            type: nil,
            myText: "AllWidgets"
        )
        completion(entry)
    }

    func getTimeline(for configuration: MyWidgetConfigurationIntent,
                     in context: Context,
                     completion: @escaping (Timeline<MyWidgetEntry>) -> ()) {
        
        Task {
            let data = AssetFetcher.loadWidgetData(suiteName: "group.allWidgets.AllWidgets")
            let currentItem = data.first(where: { $0.id == configuration.selectedWidget?.identifier ?? "0" })
            
            let entry = MyWidgetEntry(
                date: Date(),
                id: currentItem?.id,
                widget: currentItem?.widget,
                size: context.family == .systemSmall ? "small" : context.family == .systemMedium ? "medium" : "small",
                type: currentItem?.type,
                myText: "1. Long press the widget\n2. Tap edit widget\n3. Choose your widget from the saved list"
            )
            
            executeTimelineCompletion(completion, timelineEntry: entry)
        }
    }
    
    func executeTimelineCompletion(_ completion: @escaping (Timeline<MyWidgetEntry>) -> (),
                                       timelineEntry: MyWidgetEntry) {
            
            // Next fetch happens 15 minutes later
            let nextUpdate = Calendar.current.date(
                byAdding: DateComponents(minute: 15),
                to: Date()
            )!
            
            let timeline = Timeline(
                entries: [timelineEntry],
                policy: .after(nextUpdate)
            )
            
            completion(timeline)
        }
}

struct MyWidget: Widget {
    
    let kind = "com.SwiftSenpaiDemo.MyTextWidget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(
            kind: kind,
            intent: MyWidgetConfigurationIntent.self,
            provider: MyWidgetTimelineProvider()
        ) { entry in
            MyWidgetView(entry: entry)
        }
        .configurationDisplayName("AllWidgets")
        .description("Set you favorite widget from the list!")
        .supportedFamilies([
            .systemSmall,
            .systemMedium
        ])
        .disableContentMarginsIfNeeded()
    }
}

// MARK: - WidgetConfiguration
extension WidgetConfiguration {
    func disableContentMarginsIfNeeded() -> some WidgetConfiguration {
        if #available(iOSApplicationExtension 17.0, *) {
            return self.contentMarginsDisabled()
        } else {
            return self
        }
    }
}
