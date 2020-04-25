//
//  DetailsView.swift
//  BonAppetit
//
//  Created by Ishtiak Ahmed on 15.04.20.
//  Copyright © 2020 ia. All rights reserved.
//

import SwiftUI

struct DetailsView: View {

    @ObservedObject var foodItem: FoodItem
    @EnvironmentObject var foodCartHolder: FoodCartHolder
    @State private var showOrderView = false

    var body: some View {
        GeometryReader { proxy in
            ZStack() {
                Image(self.foodItem.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)

                VStack() {
                    HStack {
                        Spacer()
                        VStack {
                            TextInCircleView(diameter: 90, text: "\(self.foodItem.price) €")
                            TextInCircleView(diameter: 70, text: "\(self.foodItem.amount) ppl")
                        }
                    }.padding()

                    Spacer()

                    Button(action: {
                        self.addToCart()
                    }) {
                        HStack {
                            Image(systemName: "cart.badge.plus")
                            Text("Add to food cart")
                        }
                        .padding(20)
                        .background(Color.baOrange)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                    }.padding()
                }
                .frame(width: proxy.size.width, height: proxy.size.height)
            }
        }
        .navigationBarTitle(Text(foodItem.title), displayMode: .inline)
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
                .environmentObject(UserInfoHolder())
                .environmentObject(self.foodCartHolder)
        }
    }

    func addToCart() {
        print("\(self.foodItem.title) added")
        foodCartHolder.foodCart.add(self.foodItem)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(foodItem: FoodItem.demoFoodItems.randomElement()!)
    }
}
