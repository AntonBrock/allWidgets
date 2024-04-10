//
//  LaunchScreen.swift
//  AllWidgets
//
//  Created by ANTON DOBRYNIN on 10.04.2024.
//

import SwiftUI

struct LaunchScreen: View {
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                PulseAnimationView()
                    .padding(.bottom, 70)
                
                Image("ic_launch_screen")
                    .resizable()
                    .frame(width: 217, height: 217)
            }
            
            Spacer()
        }
    }
}

struct PulseAnimationView: View {
    @State private var waveAnimation = false

    var body: some View {
        ZStack {
            Circle()
                .fill(Colors.purple_main_color)
                .frame(width: 200, height: 200)
                .scaleEffect(waveAnimation ? 1.5 : 0.2)
                .opacity(waveAnimation ? 0 : 1)
                .animation(
                    Animation.easeInOut(duration: 2.5)
                        .repeatForever(autoreverses: false)
                )
            
            Circle()
                .fill(Colors.purple_main_color)
                .frame(width: 200, height: 200)
                .scaleEffect(waveAnimation ? 2.0 : 0.2)
                .opacity(waveAnimation ? 0 : 1)
                .animation(
                    Animation.easeInOut(duration: 3.0)
                        .repeatForever(autoreverses: false)
                )
            
            Circle()
                .fill(Colors.purple_main_color)
                .frame(width: 200, height: 200)
                .scaleEffect(waveAnimation ? 2.5 : 0.2)
                .opacity(waveAnimation ? 0 : 1)
                .animation(
                    Animation.easeInOut(duration: 3.5)
                        .repeatForever(autoreverses: false)
                )
        }
        .onAppear() {
            self.waveAnimation.toggle()
        }
    }
}
