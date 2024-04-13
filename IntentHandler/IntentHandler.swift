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
                identifier: asset.id,
                display: "\(asset.widget) \(getNumberOfType(type: asset.type))"
            )
            
            curent.widget = asset.widget
            curent.size = asset.size
            curent.type = asset.type
            
            return curent
        }
        
        // Create a collection with the array of cryptos.
        let collection = INObjectCollection(items: cryptos)
        
        // Return the collections
        return collection
    }
    
    private func getNumberOfType(type: String) -> String {
        switch type {
        case "basic": return "1"
        case "halfOnHalf": return "2"
        case "simple": return "3"
        case "bigger": return "4"
        default: return type
        }
    }

    override func handler(for intent: INIntent) -> Any {
        return self
    }
    
}
