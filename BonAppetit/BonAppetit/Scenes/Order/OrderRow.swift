//
//  OrderRow.swift
//  BonAppetit
//
//  Created by Ishtiak Ahmed on 27.04.20.
//  Copyright © 2020 ia. All rights reserved.
//

import SwiftUI

struct OrderRow: View {

     var imageName: String
     var title: String
     var price: Int
     var quantity: Int

    var body: some View {
        HStack() {
            Image(imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .shadow(radius: 5)

            VStack(alignment: .leading)  {
                Text(title)
                Text("\(price) €")
                Text("Quantity \(quantity)")
            }

            Spacer()

            Text("\(quantity * price) €")
                .font(.title)
                .foregroundColor(Color.black)
                .frame(width: 80.0)
        }
        .padding([.leading, .trailing])
    }
}

struct OrderRow_Previews: PreviewProvider {
    static var previews: some View {
        OrderRow(imageName: "1", title: "Test", price: 12, quantity: 1)
    }
}
