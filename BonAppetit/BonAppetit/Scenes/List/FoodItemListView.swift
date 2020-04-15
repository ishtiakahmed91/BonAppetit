//
//  FoodItemListView.swift
//  BonAppetit
//
//  Created by Ishtiak Ahmed on 14.04.20.
//  Copyright © 2020 ia. All rights reserved.
//

import SwiftUI

struct FoodItemListView: View {

    @State private var foodItems: [FoodItem] = FoodItem.demoFoodItems
    @State private var isFilteringFoodItems: Bool = false

    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $isFilteringFoodItems) {
                    Text(verbatim: "Show loved foods")
                }

                ForEach(foodItems) { foodItem in
                    if !self.isFilteringFoodItems || foodItem.reaction == .love {
                        FoodItemRowView(foodItem: foodItem)
                    }
                }
            }
            .navigationBarTitle(Text(verbatim: "Bon Appetit"))
        }
    }
}

struct FoodItemListUIView_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemListView()
    }
}
