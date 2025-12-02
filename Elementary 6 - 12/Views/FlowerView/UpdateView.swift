//
//  updateView.swift
//  Montessori for All
//
//  Created by Shakhnoza Mirabzalova on 12/1/25.
//

import SwiftUI

struct UpdateView: View {
    @EnvironmentObject var store: FlowerStore
    @State var name: String = ""
    @State var flowerDescription: String = ""
    @State var id: UUID = UUID()
    let flower: Flower
    var body: some View {
        
        Text(flower.name)
        
        TextField("Name", text: $name)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        
        TextField("Flower Description", text: $flowerDescription)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        
        Button("Update") {
            store.update(id: id, newName: name, newFlowerDescription: flowerDescription)
        }
    }
}

//#Preview {
//    UpdateView()
//}
