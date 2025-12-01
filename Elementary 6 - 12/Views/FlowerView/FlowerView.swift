//
//  FlowerView.swift
//  Montessori for All
//
//  Created by Shakhnoza Mirabzalova on 11/24/25.
//

import SwiftUI
// We define the view here
struct FlowerView: View {
    // @State is used to change items within the view
    @State var name: String = ""
    @State var type: String = ""
    @State var colorChange: Color = .red
    // I need to inject environmentObject to the FlowerView struct that's in the main App struct
    @EnvironmentObject var flowerStore: FlowerStore
    
    var id: UUID = UUID()
    var colors: [Color] = [.red,  .blue, .yellow, .green, .orange, .purple]
    
    var body: some View {
        NavigationStack {
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
                flowerStore.save(id: id, name: name, type: type)
            }
            
            Button() {
                colorChange = colorChange == colors.last! ? colors.first! : colors.randomElement()!
            } label: {
                Text("Change color")
            }
            
            List {
                ForEach(flowerStore.flowers) { flower in
                    
                    NavigationLink (destination: FlowerDetailView(flower: flower)) {
                        
                        Text("\(flower.name)")
                            .foregroundStyle(colorChange)
                            .font(Font.custom("DragonHunter", size: 20.0))
                            .bold()
                    }
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            flowerStore.delete(flower: flower)
                        } label: {
                            Text("Delete")
                        }
                }
            }
            }
        }
    }
    }
}

//#Preview {
//    FlowerView()
//        .environmentObject(FlowerStore(modelContainer: <#ModelContainer#>))
//}
