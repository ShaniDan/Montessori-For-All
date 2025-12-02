//
//  DataStore.swift
//  Montessori for All
//
//  Created by Shakhnoza Mirabzalova on 11/24/25.
//

import Foundation
import SwiftData
// I don't need to import combine when I use @Observable
import Combine
// DataStore handles the interaction with SwiftData
@MainActor
final class FlowerStore: ObservableObject {
    ///
    /// An observable object is used with @Published and @EnvironmentObject
    /// to read and write values across views. An .environmentObject instance is
    /// placed at the top of the view hierarchy. In this case in the WindowGroup
    ///
    @Published private(set) var flowers: [Flower] = []
    /// ModelContainer - An object that manages an app's schema and model storage configuration.
    private let modelContainer: ModelContainer
    /// ModelContext - An object that enables you to fetch, insert, and delete models, and save any changes to disk.
    private var modelContext: ModelContext {modelContainer.mainContext}
    
    
    init(modelContainer: ModelContainer) {
        self.modelContainer = modelContainer
        reload()
    }
    
    func save(id: UUID, name: String, flowerDescription: String) {
        do {
            let items = Flower(
                id: id, name: name, flowerDescription: flowerDescription
            )
            modelContext.insert(items)
            try modelContext.save()
            reload()
            print("item saved \(items.name), \(items.id)")
        } catch {
           print("Not Saved")
        }
    }
    
    func update(id: UUID, newName: String, newFlowerDescription: String) {
        do {
            let descriptor = FetchDescriptor<Flower>(
                predicate: #Predicate { $0.id == id }
            )
            
            if let existingFlower = try modelContext.fetch(descriptor).first {
                existingFlower.name = newName
                existingFlower.flowerDescription = newFlowerDescription
                
                try modelContext.save()
                reload()
                
                print("Updated flower: \(existingFlower.name)")
            } else {
                print("Flower not found")
            }
            
        } catch {
            print("Update failed: \(error)")
        }
    }

    func reload() {
             do {
                 flowers = try modelContext.fetch(FetchDescriptor<Flower>())
             } catch {
                 print("Failed to load flowers: \(error)")
             }
         }
    
    func delete(flower: Flower) {
        modelContext.delete(flower)
    }
}
