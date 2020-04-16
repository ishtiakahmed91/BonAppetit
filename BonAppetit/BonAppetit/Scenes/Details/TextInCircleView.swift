//
//  TextInCircleView.swift
//  BonAppetit
//
//  Created by Ishtiak Ahmed on 16.04.20.
//  Copyright © 2020 ia. All rights reserved.
//

import SwiftUI

struct TextInCircleView: View {
    var diameter: CGFloat
    var text: String
    var body: some View {
        ZStack {
            Circle()
                .frame(width: diameter, height: diameter)
                .foregroundColor(.black)
                .opacity(0.4)
            Text(verbatim: text)
                .font(.title)
                .fontWeight(.light)
                .foregroundColor(Color.white)
        }
        .shadow(radius: 20)

    }
}

struct TextInCircleView_Previews: PreviewProvider {
    static var previews: some View {
        TextInCircleView(diameter: 100, text: "12")
    }
}
