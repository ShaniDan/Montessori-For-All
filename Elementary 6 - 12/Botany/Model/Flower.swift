//
//  Flower.swift
//  Montessori for All
//
//  Created by Shakhnoza Mirabzalova on 11/17/25.
//

import Foundation
import SwiftData

//https://www.nienhuis.com/eu/product/botany-puzzle-activity-set/400_020201/
// https://www.youtube.com/watch?v=a1rJ8FXC3gU
// https://github.com/DKabashi/TicTacToeAR
//https://www.reddit.com/r/swift/comments/174wetv/tictactoe_ar_game_using_arkit_and_realitykit/
/*
 I need to follow this material to build a small AR MVP that detects a flower using the device camera and overlays its anatomical parts—such as the pistil, stamen, sepal, and others—in real time. When the camera recognizes the flower, the app should identify the main structures and display them as AR labels or annotations. https://theglobalmontessorinetwork.org/resource/elementary/parts-of-flower-english/
 */

@Model
class Flower: Identifiable {
    @Attribute(.unique) var id: UUID
    var name: String
    var flowerDescription: String
    
    init(id: UUID, name: String, flowerDescription: String ) {
        self.id = UUID()
        self.name = name
        self.flowerDescription = flowerDescription
    }
}

