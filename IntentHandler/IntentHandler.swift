//
//  IntentHandler.swift
//  IntentHandler
//
//  Created by ANTON DOBRYNIN on 13.04.2024.
//

import Intents
import SwiftUI

class IntentHandler: INExtension, MyWidgetConfigurationIntentHandling {
    func provideSelectedWidgetOptionsCollection(for intent: MyWidgetConfigurationIntent) async throws -> INObjectCollection<Current> {

        let assets = AssetFetcher.loadWidgetData(suiteName: "group.allWidgets.AllWidgets")
        
        let cryptos = assets.map { asset in
            
            let curent = Current(
                identifier: String(asset.id),
                display: "\(asset.widget) \(getNumberOfType(type: asset.type))"
            )
            
            curent.widget = asset.widget
            curent.size = asset.size
            curent.type = asset.type
            
            return curent
        }
        
        let collection = INObjectCollection(items: cryptos)        
        return collection
    }
    
    private func getNumberOfType(type: String) -> String {
        switch type {
        case "basic": return "1"
        case "halfOnHalf": return "2"
        case "simple": return "3"
        case "bigger": return "4"
        case "space": return "5"
        case "car": return "6"
        case "bitch": return "7"
        case "london": return "8"
        default: return type
        }
    }

    override func handler(for intent: INIntent) -> Any {
        return self
    }
    
}
