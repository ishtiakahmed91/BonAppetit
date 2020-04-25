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
    @State private var showOrderView = false
    @EnvironmentObject var userInfoHolder: UserInfoHolder
    @EnvironmentObject var foodCartHolder: FoodCartHolder


    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $isFilteringFoodItems) {
                    Text(verbatim: "Show loved foods")
                        .foregroundColor(.baOrange)
                }

                ForEach(foodItems) { foodItem in
                    if !self.isFilteringFoodItems || foodItem.reaction == .love {
                        FoodItemRowView(foodItem: foodItem)
                            .environmentObject(self.foodCartHolder)
                    }
                }
                .buttonStyle(BorderlessButtonStyle())
            }
            .animation(.easeIn)
            .navigationBarTitle(Text(verbatim: "Bon Appetit"))
            .navigationBarItems(
                trailing: Button(action: {
                    self.showOrderView = true
                }, label: {
                    HStack {
                        Image(systemName: "cart")
                        if !self.foodCartHolder.foodCart.isEmpty {
                            Text("\(self.foodCartHolder.foodCart.totalCount)")
                        }
                    }
                })
            ).sheet(isPresented: self.$showOrderView) {
                OrderView()
                    .environmentObject(self.userInfoHolder)
                    .environmentObject(self.foodCartHolder)
            }
        }
    }
}


struct FoodItemListUIView_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemListView()
    }
}
