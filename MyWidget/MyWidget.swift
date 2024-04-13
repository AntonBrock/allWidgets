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
    var date: Date
    let id: Int?
    let widget: String?
    var size: String?
    var type: String?
    let myText: String
}

struct MyWidgetView: View {
    
    @State var entry: MyWidgetEntry
    
    var body: some View {
        VStack {
            switch entry.widget {
            case "Clock":
                ClockWidget(date: $entry.date, size: $entry.size, type: $entry.type)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            case "Calendar": Text("Calendar")
            case "Photo": Text("Photo")
            default:
                Text("1. Long press the widget\n2. Tap edit widget\n3. Choose your widget from the saved list")
                    .font(.subheadline.weight(.light))
            }
        }
        .containerBackground(for: .widget) {
            switch entry.type {
            case "basic": Colors.main_active_border_color.opacity(0.3)
            case "bigger": Colors.purple_main_color
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
            myText: "All Widgets"
        )
        completion(entry)
    }

    func getTimeline(for configuration: MyWidgetConfigurationIntent,
                     in context: Context,
                     completion: @escaping (Timeline<MyWidgetEntry>) -> ()) {
        
        Task {
            let data = AssetFetcher.loadWidgetData(suiteName: "group.allWidgets.AllWidgets")
            let id = Int(configuration.selectedWidget?.identifier ?? "0") ?? 0
            
            let entry = MyWidgetEntry(
                date: Date(),
                id: id,
                widget: data[id].widget,
                size: context.family == .systemSmall ? "small" : context.family == .systemMedium ? "medium" : "small",
                type: data[id].type,
                myText: "1. Long press the widget\n2. Tap edit widget\n3. Choose your widget from the saved list"
            )

            executeTimelineCompletion(completion, timelineEntry: entry)
        }
    }
    
    func executeTimelineCompletion(_ completion: @escaping (Timeline<MyWidgetEntry>) -> (),
                                       timelineEntry: MyWidgetEntry) {
            
            let nextUpdate = Calendar.current.date(
                byAdding: DateComponents(minute: 1),
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
