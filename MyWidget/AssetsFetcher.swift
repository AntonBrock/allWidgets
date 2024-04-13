//
//  AssetsFetcher.swift
//  AllWidgets
//
//  Created by ANTON DOBRYNIN on 13.04.2024.
//

import Foundation

struct Asset {
    let id: Int
    let widget: String
    let type: String
    let size: String
}

struct AssetFetcher {
    
    static func loadWidgetData(suiteName: String) -> [Asset] {
        let widgetsData = UserDefaults(suiteName: suiteName)?.array(forKey: "savedWidget") as? [[String: Any]] ?? []
        
        return widgetsData.compactMap { widgetData in
            return Asset(
                id: widgetData["id"] as? Int ?? 0,
                widget: widgetData["widget"] as? String ?? "",
                type: widgetData["type"] as? String ?? "",
                size: widgetData["size"] as? String ?? ""
            )
        }
    }
}
