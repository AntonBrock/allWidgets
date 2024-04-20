//
//  MyWidgetBundle.swift
//  MyWidget
//
//  Created by ANTON DOBRYNIN on 13.04.2024.
//

import WidgetKit
import SwiftUI

@main
struct MyWidgetBundle: WidgetBundle {
    var body: some Widget {
        if #available(iOS 17.0, *) {
            return WidgetBundleBuilder.buildBlock(MyWidget())
        } else {
            return MyWidget()
        }
    }
}
