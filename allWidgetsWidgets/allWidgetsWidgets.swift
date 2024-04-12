//
//  allWidgetsWidgets.swift
//  allWidgetsWidgets
//
//  Created by ANTON DOBRYNIN on 11.04.2024.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emoji: "😀")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emoji: "😀")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: "😀")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: String
}

struct allWidgetsWidgetsEntryView : View {
    @AppStorage("savedWidgetSize") private var savedWidgetSize: String?
    @AppStorage("savedWidgetType") private var savedWidgetType: String?
    @AppStorage("savedWidget") private var savedWidget: String?
    
    var entry: Provider.Entry

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(hex: "ccd0f8"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "ccd0f8"))
        .onAppear {
            if let userDefaults = UserDefaults(suiteName: "group.allWidgets.AllWidgets") {
                
                if let savedWidgets = userDefaults.array(forKey: "savedWidget") as? [[String: Any]] {
                        print(savedWidgets)
                }
            }
        }
    }
}

struct allWidgetsWidgets: Widget {
    let kind: String = "allWidgetsWidgets"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                allWidgetsWidgetsEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                allWidgetsWidgetsEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    allWidgetsWidgets()
} timeline: {
    SimpleEntry(date: .now, emoji: "😀")
    SimpleEntry(date: .now, emoji: "🤩")
}
