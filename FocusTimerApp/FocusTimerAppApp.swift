//
//  FocusTimerAppApp.swift
//  FocusTimerApp
//
//  Created by Elias Puolitaival on 2024-11-21.
//

import SwiftUI
import Firebase

@main
struct FocusTimerAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
