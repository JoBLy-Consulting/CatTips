//
//  CatTips_Widget.swift
//  CatTips_Widget
//
//  Created by Johan Guenaoui on 06/09/2023.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), fact: CurrentCatsTips.currentTip())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), fact: CurrentCatsTips.currentTip())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entries: [SimpleEntry] = [SimpleEntry(date: Date(), fact: CurrentCatsTips.currentTip())]

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let fact: String
}

struct CatTips_WidgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        VStack {
            Text(entry.fact)
                .foregroundStyle(Color.white)
                .contentTransition(.opacity)
            Button(intent: CatTips_Intent()) {
                Text("Get a new tip")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct CatTips_Widget: Widget {
    let kind: String = "CatTips_Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                CatTips_WidgetEntryView(entry: entry)
                    .containerBackground(Color.teal, for: .widget)
            } else {
                CatTips_WidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("Cats Tip Widget")
        .description("Do you want to know more about Cats ?")
    }
}

#Preview(as: .systemMedium) {
    CatTips_Widget()
} timeline: {
    SimpleEntry(date: .now, fact: "Fact1")
    SimpleEntry(date: .now, fact: "Fact2")
}
