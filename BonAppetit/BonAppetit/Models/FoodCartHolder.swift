//
//  FoodCartHolder.swift
//  BonAppetit
//
//  Created by Ishtiak Ahmed on 22.04.20.
//  Copyright © 2020 ia. All rights reserved.
//

import SwiftUI
import Combine

struct FoodCart: Identifiable {
    var id = UUID()
    var quantity = 0
    var foodItem: FoodItem
}

class FoodCartHolder: ObservableObject, Identifiable {
    @Published var foodCarts: [FoodCart] = []
}
