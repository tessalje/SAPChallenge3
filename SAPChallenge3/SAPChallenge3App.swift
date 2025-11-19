//
//  SAPChallenge3App.swift
//  SAPChallenge3
//
//  Created by Tessa Lee on 6/11/25.
//

import SwiftUI
import SwiftData

@main
struct SAPChallenge3App: App {
    var container: ModelContainer
    
    init() {
        do {
            let config1 = ModelConfiguration(for: Photo.self)
            let config2 = ModelConfiguration(for: FishCollected.self)
            
            container = try ModelContainer(for: Photo.self, FishCollected.self)
        } catch {
            fatalError("failed to config")
        }
    }
    var body: some Scene {
        WindowGroup {
            OnboardingView()
        }
        .modelContainer(container)
    }
}
