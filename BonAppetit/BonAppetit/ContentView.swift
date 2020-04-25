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
                        Text(verbatim: "Foods")
                    }
            }.tag(1)

            SettingsView()
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text(verbatim: "Settings")
                    }
            }.tag(2)
        }
        .accentColor(.baOrange)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
