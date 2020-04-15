//
//  FoodItemRowView.swift
//  BonAppetit
//
//  Created by Ishtiak Ahmed on 14.04.20.
//  Copyright © 2020 ia. All rights reserved.
//

import SwiftUI
import Combine

struct FoodItemRowView: View {

    @ObservedObject var foodItem: FoodItem

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(verbatim: foodItem.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Spacer()
                
                Text(verbatim: "\(foodItem.price) €")
                    .font(.headline)
                    .fontWeight(.bold)
            }
            .padding(.top, 30)

            Image(foodItem.imageName)
                .resizable()
                .cornerRadius(30)
                .frame(height: 600)
                .clipped()


            HStack {
                Image(systemName: "person.crop.square")
                .renderingMode(.original)

                Text(verbatim: "\(foodItem.amount) serving")
                    .font(.body)
                    .fontWeight(.bold)

                Spacer()

                Picker("Reaction", selection: $foodItem.reaction) {
                    ForEach(Reaction.allCases, id: \.self) { reaction in
                        Text(reaction.rawValue).tag(reaction)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding(.bottom)
        }
    }
}

struct FoodItemRowView_Previews: PreviewProvider {

    static var bindingFoodItem = FoodItem.demoFoodItems.randomElement()!
    static var previews: some View {
        FoodItemRowView(foodItem: bindingFoodItem)
    }
}
