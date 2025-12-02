//
//  FlowerDetailView.swift
//  Montessori for All
//
//  Created by Shakhnoza Mirabzalova on 12/1/25.
//

import SwiftUI
import SwiftData

/// Use @StateObject with @ObservedObjects to pass data
/// in a hierarchy of views

struct FlowerDetailView: View {
    // @StateObject creates and owns the object
    // @EnvironmentObject receives the object from the environment (root view)
    // But @StateObject shows error that I need to explicitly define modelContainer
    
    @StateObject var viewModel = FlowerViewModel()
    
    @EnvironmentObject var flowerStore: FlowerStore
    // need to understand how this works deeper, is it a binding?
    let flower: Flower
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Chamomile")
                    .resizable()
                    .opacity(0.3)
                    .ignoresSafeArea()
                VStack {
                    // this needs to have a binding
                    NavigationLink(destination: UpdateView(flower: flower)) {
                        Text("Update")
                    }
                    Text("Hi I'm \(flower.name) 🌼")
                        .padding(10)
                    Text("\(flower.flowerDescription)")
                        .multilineTextAlignment(.leading)
                        .lineSpacing(5)
                        .padding()
                    
                }
                .font(Font.custom("DragonHunter", size: 15.0))
                .padding(10)
                .foregroundStyle(Color("NavyBlue"))
                .bold()
            }
        }
    }
}

//#Preview {
//    FlowerDetailView()
//}
