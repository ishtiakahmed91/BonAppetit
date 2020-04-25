//
//  OrderView.swift
//  BonAppetit
//
//  Created by Ishtiak Ahmed on 15.04.20.
//  Copyright © 2020 ia. All rights reserved.
//

import SwiftUI

struct OrderView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var userInfoHolder: UserInfoHolder
    @EnvironmentObject var foodCartHolder: FoodCartHolder

    var isShippingAddressInfoAvaialable: Bool {
        return !userInfoHolder.userInfo.streetAndHouseNumber.isEmpty && !userInfoHolder.userInfo.city.isEmpty && !userInfoHolder.userInfo.postCode.isEmpty
    }
    var isPaymentInfoAvaialable: Bool {
        return (!userInfoHolder.userInfo.bankOrCreditCardNumber.isEmpty && !userInfoHolder.userInfo.bankOrCreditCardHolder.isEmpty) || userInfoHolder.userInfo.isCashOnDelivery
    }

    var isOrderButtonDisable: Bool {
        return !isShippingAddressInfoAvaialable || !isPaymentInfoAvaialable
    }

    var orderButtonOpacity: Double {
        return isOrderButtonDisable ? 0.6 : 1.0
    }

    var orderInstruction: String {
        var instruction = ""
        if !isShippingAddressInfoAvaialable {
            instruction += " shipping address"
        }
        if !isShippingAddressInfoAvaialable && !isPaymentInfoAvaialable {
            instruction += " and"
        }
        if !isPaymentInfoAvaialable {
            instruction += " payment method"
        }
        return instruction + "."
    }

    var paymentInfo: (String,String) {
        let title = userInfoHolder.userInfo.isCashOnDelivery ? "Cash On Delivery" : userInfoHolder.userInfo.bankOrCreditCardHolder
        let subtitle = userInfoHolder.userInfo.isCashOnDelivery ? "Receipt available" : userInfoHolder.userInfo.bankOrCreditCardNumber
        return (title, subtitle)
    }

    var totalAmount: Int {
        return foodCartItems.reduce(0) { $0 + ($1.foodItem.price * $1.quantity) }
    }

    var foodCartItems: [FoodCartItem] {
        return foodCartHolder.foodCart.map { (foodItem: FoodItem, count: Int) -> FoodCartItem in
            return FoodCartItem(id: foodItem.id, quantity: count, foodItem: foodItem)
        }
    }

    var body: some View {
        ZStack {
            Color.baOrange.edgesIgnoringSafeArea(.all)

            if self.foodCartHolder.foodCart.count == 0 {
                VStack {
                    Image(systemName: "wind")
                        .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                    Text("Your order list is empty!")
                }
            } else {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Total Amount")
                                .font(.title)
                            Text("Number of Items \(foodCartHolder.foodCart.count)")
                                .font(.footnote)
                        }
                        Text("\(totalAmount) €")
                            .font(.largeTitle)
                            .foregroundColor(Color.black)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()

                    Divider()
                    ScrollView {
                        ForEach(foodCartItems) { item in
                            HStack() {
                                Image(item.foodItem.imageName)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                    .shadow(radius: 5)

                                VStack(alignment: .leading)  {
                                    Text("\(item.foodItem.title)")
                                    Text("\(item.foodItem.price) €")
                                    Text("Quantity \(item.quantity)")
                                }

                                Spacer()

                                Text("\(item.quantity * item.foodItem.price) €")
                                    .font(.title)
                                    .foregroundColor(Color.black)
                                    .frame(width: 80.0)
                            }
                            .padding([.leading, .trailing])
                        }
                    }

                    Divider()
                    if isShippingAddressInfoAvaialable {
                        HStack() {
                            Image(systemName: "location").padding()
                            VStack(alignment: .leading) {
                                Text("\(userInfoHolder.userInfo.streetAndHouseNumber)")
                                Text("\(userInfoHolder.userInfo.postCode) \(userInfoHolder.userInfo.city)")
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .trailing])
                    }

                    if isPaymentInfoAvaialable {
                        HStack() {
                            Image(systemName: "creditcard").padding()
                            VStack(alignment: .leading) {
                                Text("\(paymentInfo.0)")
                                Text("\(paymentInfo.1)")
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    }

                    if !isPaymentInfoAvaialable || !isShippingAddressInfoAvaialable {
                        Text("To proceed the order please update\(orderInstruction) ")
                            .font(.footnote)
                            .padding()
                    }

                    Spacer()

                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "arrow.turn.down.right")
                            Text("Order Now")
                        }
                        .padding(20)
                        .background(Color.white)
                        .opacity(orderButtonOpacity)
                        .foregroundColor(.baOrange)
                        .cornerRadius(40)
                    }.disabled(isOrderButtonDisable)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            }
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
