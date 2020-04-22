//
//  SettingsView.swift
//  BonAppetit
//
//  Created by Ishtiak Ahmed on 21.04.20.
//  Copyright © 2020 ia. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    private var paymentMethods = ["Bank Transfer", "Credit Card"]
    @State private var selectedMethod = 0
    @EnvironmentObject var userInfoHolder: UserInfoHolder

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Shipping Address")){
                    TextField("Street and House Number", text: $userInfoHolder.userInfo.streetAndHouseNumber)
                    TextField("Post Code/PLZ", text: $userInfoHolder.userInfo.postCode)
                        .textContentType(.postalCode)
                    TextField("City", text: $userInfoHolder.userInfo.city)
                }

                Section(header: Text("Payment")){
                    Toggle(isOn: $userInfoHolder.userInfo.isCashOnDelivery) {
                        Text("Cash On Delivery")
                    }

                    if !userInfoHolder.userInfo.isCashOnDelivery {
                        Picker(selection: $selectedMethod, label:
                        Text("Payment Method")
                        ) {
                            ForEach(0..<paymentMethods.count) {
                                Text(self.paymentMethods[$0])
                            }
                        }

                        TextField(self.selectedMethod == 0 ? "Account Holder" : "Name", text: $userInfoHolder.userInfo.bankOrCreditCardHolder)
                        TextField(self.selectedMethod == 0 ? "IBAN" : "Card Number", text: $userInfoHolder.userInfo.bankOrCreditCardNumber)
                    }
                }

                Section(header: Text("About")) {
                    HStack {
                        Text("Appetit Version")
                        Spacer()
                        Text("1.0.0")
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
