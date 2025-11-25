//
//  Montessori_for_AllApp.swift
//  Montessori for All
//
//  Created by Shakhnoza Mirabzalova on 11/17/25.
//

import SwiftUI
import SwiftData

@main
struct Montessori_for_AllApp: App {
 
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Flower.self,
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
            // it's created here
            FlowerView()
            // "Thread 1: Fatal error: No ObservableObject of type FlowerStore found. A View.environmentObject(_:) for FlowerStore may be missing as an ancestor of this view." if it's not here it shows this error
            .environmentObject(FlowerStore(modelContainer: sharedModelContainer))
        }
        .modelContainer(sharedModelContainer)
    }
}
