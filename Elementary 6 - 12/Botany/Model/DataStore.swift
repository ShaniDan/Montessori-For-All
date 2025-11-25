//
//  DataStore.swift
//  Montessori for All
//
//  Created by Shakhnoza Mirabzalova on 11/24/25.
//

import Foundation
import SwiftData
import Combine

/*
 tundsdev
 why would you use each one, in what situation (cases)
 ObservableObject
 @ObservedObject
 @Published
 
 @State
 @Binding
 @StateObject
 */

// This handles the interaction with SwiftData
@MainActor
final class FlowerStore: ObservableObject {
    // view update
    @Published private(set) var flowers: [Flower] = []
    private let modelContainer: ModelContainer
    private var modelContext: ModelContext {modelContainer.mainContext}
    
    
    init(modelContainer: ModelContainer) {
        self.modelContainer = modelContainer
        reload()
    }
    
    func reload() {
             do {
                 flowers = try modelContext.fetch(FetchDescriptor<Flower>())
             } catch {
                 print("Failed to load flowers: \(error)")
             }
         }
    
    func save(id: UUID, name: String, type: String) {
        do {
            let items = Flower(
                id: id, name: name, type: type
            )
            modelContext.insert(items)
            try modelContext.save()
            reload()
            print("item saved \(items.name), \(items.id)")
        } catch {
           print("Not Saved")
        }
    }
}
