//
//  CoffeeOrder2App.swift
//  CoffeeOrder2
//
//  Created by Louise Rennick on 2025-01-30.
//

import SwiftUI
import SwiftData

@main
struct CoffeeOrder2App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            CoffeeOrder.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}

