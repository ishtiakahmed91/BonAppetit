//
//  UserInfoHolder.swift
//  BonAppetit
//
//  Created by Ishtiak Ahmed on 22.04.20.
//  Copyright © 2020 ia. All rights reserved.
//

import SwiftUI
import Combine

struct UST {
    var isCashOnDelivery = false
    var bankOrCreditCardHolder = ""
    var bankOrCreditCardNumber = ""
    var streetAndHouseNumber = ""
    var postCode = ""
    var city = ""
}

class UserInfoHolder: ObservableObject {
    @Published var score = UST()
}
