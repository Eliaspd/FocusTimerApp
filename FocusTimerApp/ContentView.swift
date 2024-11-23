//
//  ContentView.swift
//  FocusTimerApp
//
//  Created by Elias Puolitaival on 2024-11-21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.pink, .purple, .blue, .green], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(136))
                .offset(y: -350)
            
            VStack(spacing: 20) {
                
            }
        }
        .ignoresSafeArea()
        }
    }


#Preview {
    ContentView()
}
