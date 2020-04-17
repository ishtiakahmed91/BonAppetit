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
                        .foregroundColor(.orange)
                }

                ForEach(foodItems) { foodItem in
                    if !self.isFilteringFoodItems || foodItem.reaction == .love {
                        FoodItemRowView(foodItem: foodItem)
                    }
                }
                .buttonStyle(BorderlessButtonStyle())
            }
            .navigationBarTitle(Text(verbatim: "Bon Appetit"))
            .navigationBarItems(
                trailing: Button(action: {
                    // Actions
                }, label: {
                    HStack {
                        Image(systemName: "bag")
                        Text("1")
                    }
                })
            )
        }

    }
}


struct FoodItemListUIView_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemListView()
    }
}
