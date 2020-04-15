//
//  ContentView.swift
//  BonAppetit
//
//  Created by Ishtiak Ahmed on 14.04.20.
//  Copyright © 2020 ia. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FoodItemListView()
                .tabItem {
                    VStack {
                        Image(systemName: "heart")
                            .renderingMode(.original)
                        Text(verbatim: "Foods")
                    }
            }.tag(1)

            OrderView()
                .tabItem {
                    VStack {
                        Image(systemName: "cart")
                            .renderingMode(.original)
                        Text(verbatim: "Order")
                    }
            }.tag(2)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
