//
//  FoodItem.swift
//  BonAppetit
//
//  Created by Ishtiak Ahmed on 14.04.20.
//  Copyright © 2020 ia. All rights reserved.
//

import Combine
import SwiftUI

enum Reaction: String, CaseIterable {
    case love = "🥰"
    case wow = "🤩"
    case like = "☺️"
    case soso = "🧐"
}

class FoodItem: Identifiable, ObservableObject {
    var id = UUID()
    var imageName: String
    var title: String
    var price: Int
    var amount: Int
    var isLoved: Bool

    @Published var isLiked = false
    @Published var reaction: Reaction

    init(
        imageName: String,
        title: String,
        price: Int,
        amount: Int,
        isLoved: Bool,
        reaction: Reaction
    ) {
        self.imageName = imageName
        self.title = title
        self.price = price
        self.amount = amount
        self.isLoved = isLoved
        self.reaction = reaction
    }
}

extension FoodItem {
    static let demoFoodItems = [
        FoodItem(imageName: "1", title: "Kacchi Biriyani", price: 28, amount: 3, isLoved: false, reaction: Reaction.allCases.randomElement()!),
        FoodItem(imageName: "2", title: "Fresh Salad", price: 6, amount: 1, isLoved: false, reaction: Reaction.allCases.randomElement()!),
        FoodItem(imageName: "3", title: "Mozarella Pizza", price: 12, amount: 1, isLoved: false, reaction: Reaction.allCases.randomElement()!),
        FoodItem(imageName: "4", title: "Pan Cake", price: 14, amount: 2, isLoved: true, reaction: Reaction.allCases.randomElement()!),
        FoodItem(imageName: "5", title: "Beef Burger", price: 15, amount: 1, isLoved: false, reaction: Reaction.allCases.randomElement()!),
        FoodItem(imageName: "6", title: "Mutton Chop", price: 22, amount: 2, isLoved: false, reaction: Reaction.allCases.randomElement()!),
        FoodItem(imageName: "7", title: "Momo Salad", price: 7, amount: 1, isLoved: false, reaction: Reaction.allCases.randomElement()!),
        FoodItem(imageName: "8", title: "Grilled Pizza", price: 14, amount: 2, isLoved: true, reaction: Reaction.allCases.randomElement()!),
        FoodItem(imageName: "9", title: "Pizza Salsa", price: 13, amount: 2, isLoved: false, reaction: Reaction.allCases.randomElement()!),
        FoodItem(imageName: "10", title: "Goat Burger", price: 15, amount: 1, isLoved: false, reaction: Reaction.allCases.randomElement()!),
        FoodItem(imageName: "11", title: "Pizza Oliva", price: 16, amount: 2, isLoved: false, reaction: Reaction.allCases.randomElement()!),
        FoodItem(imageName: "12", title: "Alu Korai", price: 8, amount: 1, isLoved: false, reaction: Reaction.allCases.randomElement()!),
        FoodItem(imageName: "13", title: "Avocado Toast", price: 10, amount: 2, isLoved: false, reaction: Reaction.allCases.randomElement()!),
        FoodItem(imageName: "14", title: "Chicken Sandwich", price: 7, amount: 1, isLoved: false, reaction: Reaction.allCases.randomElement()!)
    ]
}
