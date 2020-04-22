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
    @State private var showOrderView = false
    @EnvironmentObject var foodCartHolder: FoodCartHolder

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
                        .background(Color.orange)
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
                    Text("\(self.foodCartHolder.foodCarts.count)")
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
        foodCartHolder.foodCarts.append(FoodCart(quantity: 1, foodItem: foodItem))
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(foodItem: FoodItem.demoFoodItems.randomElement()!)
    }
}
