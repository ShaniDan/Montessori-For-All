//
//  ViewModel.swift
//  Montessori for All
//
//  Created by Shakhnoza Mirabzalova on 12/1/25.
//

import Foundation
import SwiftData
import Combine

class FlowerViewModel: ObservableObject {
    @Published var flower = Flower(id: UUID(), name: "Hello", type: "World")
    
    
}
