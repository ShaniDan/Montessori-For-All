//
//  FlowerView.swift
//  Montessori for All
//
//  Created by Shakhnoza Mirabzalova on 11/24/25.
//

import SwiftUI
// We define the view here
struct FlowerView: View {
    
    @State var name: String = ""
    // I need to inject environmentObject to the FlowerView struct that's in the main App struct
    @EnvironmentObject var flowerStore: FlowerStore
    var id: UUID = UUID()
    @State var type: String = ""
    
    var body: some View {
        VStack {
            // TextField to enter the name
            TextField("name", text: $name)
                .frame(width: 250, height: 30)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.blue)
                )
            Button("Save") {
                // save function from swiftData
                flowerStore.save(id: id, name: name, type: type)
            }
            
            List {
                ForEach(flowerStore.flowers) { flower in
                    Text("\(flower.name)")
                }
            }
        }
    }
}

//#Preview {
//    FlowerView()
//        .environmentObject(FlowerStore(modelContainer: <#ModelContainer#>))
//}
