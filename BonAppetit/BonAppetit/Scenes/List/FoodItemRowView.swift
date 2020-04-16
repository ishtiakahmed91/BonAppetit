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
        NavigationLink(destination: DetailsView(foodItem: foodItem)) {
            VStack(alignment: .leading) {
                HStack {
                    Text(verbatim: foodItem.title)
                        .font(.largeTitle)
                        .fontWeight(.thin)

                    Spacer()

                    Text(verbatim: "\(foodItem.price) €")
                        .font(.title)
                        .fontWeight(.thin)
                        .foregroundColor(.orange)
                }
                .padding(.top, 10)

                Image(foodItem.imageName)
                    .resizable()
                    .cornerRadius(20)
                    .frame(height: 600)
                    .clipped()
                    .padding(.top, -10)

                HStack {
                    Image(systemName: "person.crop.square")
                        .foregroundColor(.orange)

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
}

struct FoodItemRowView_Previews: PreviewProvider {
    static var bindingFoodItem = FoodItem.demoFoodItems.randomElement()!
    static var previews: some View {
        FoodItemRowView(foodItem: bindingFoodItem)
    }
}
