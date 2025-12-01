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
    // @EnvironmentObject receives the object from above
    // But @StateObject shows error that I need to explicitly define modelContainer
    
    //    @StateObject var viewModel = FlowerViewModel()
    
    @EnvironmentObject var flowerStore: FlowerStore
    let flower: Flower
    
    var body: some View {
        ZStack {
            Image("Chamomile")
                .resizable()
                .opacity(0.3)
                .ignoresSafeArea()
            VStack {
                
                Text("Hi I'm \(flower.name) 🌼")
                
                Text(" \nChamomile is a flower native to Europe and Asia that now grows widely in the U.S. There are two main types: German chamomile (from southern/eastern Europe) and Roman chamomile (native to northern Africa and parts of Europe, with an apple-like scent).")
                    .multilineTextAlignment(.leading)
                
                Text("\nTraditional Uses: Chamomile is commonly used to reduce anxiety and promote relaxation. It’s generally safe as a tea and likely safe for short-term use, though long-term safety is not well known.")
                    .multilineTextAlignment(.leading)
                
                Text("\nIn Europe, chamomile is also used for wound healing and reducing inflammation. A 2021 study found chamomile helped wounds heal faster due to its high levels of phytochemicals.")
                    .multilineTextAlignment(.leading)
                
                Text("\nA 2016 review showed chamomile has many benefits, including antioxidant, antimicrobial, anti-inflammatory, and antidiabetic effects. It may also help with knee osteoarthritis, ulcerative colitis, PMS, and digestive issues.")
                    .multilineTextAlignment(.leading)
                    
            }
            .font(Font.custom("DragonHunter", size: 15.0))
            .padding(10)
            .foregroundStyle(Color("NavyBlue"))
            .bold()
        }
    }
}

//#Preview {
//    FlowerDetailView()
//}
