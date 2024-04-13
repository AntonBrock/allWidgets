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
                Text(entry.type ?? "")
            }
        }
        .containerBackground(for: .widget) { }
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
                size: currentItem?.size,
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
    }
}
