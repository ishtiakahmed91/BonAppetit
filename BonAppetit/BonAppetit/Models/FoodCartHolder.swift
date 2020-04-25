//
//  FoodCartHolder.swift
//  BonAppetit
//
//  Created by Ishtiak Ahmed on 22.04.20.
//  Copyright © 2020 ia. All rights reserved.
//

import SwiftUI
import Combine

class FoodCartHolder: ObservableObject, Identifiable {
    @Published var foodCart = Bag<FoodItem>()
}

struct FoodCartItem: Identifiable {
    var id: ObjectIdentifier
    var quantity: Int
    var foodItem: FoodItem
}

