//
//  OnboardingViewModel.swift
//  AllWidgets
//
//  Created by ANTON DOBRYNIN on 10.04.2024.
//

import Foundation

struct OnboardingModel: Identifiable {
    let id: Int
    let text: String
    let image_name: String
}

final class OnboardingViewModel: ObservableObject {
    let oboardingScreens: [OnboardingModel] = [
        OnboardingModel(
            id: 0,
            text: "Touch and hold an empty area on the\nHome screen until the editing mode is activated",
            image_name: "onboarding_page_one"
        ),
        OnboardingModel(
            id: 1,
            text: "Press the (+) button in the top corner",
            image_name: "onboarding_page_two"
        ),
        OnboardingModel(
            id: 2,
            text: "Search the AllWidget App",
            image_name: "onboarding_page_three"
        ),
        OnboardingModel(
            id: 3,
            text: "Select widgets and click “Add Widgets”\nThat's it!",
            image_name: "onboarding_page_four"
        )
    ]
}
