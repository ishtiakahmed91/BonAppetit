//
//  UserInfoRow.swift
//  BonAppetit
//
//  Created by Ishtiak Ahmed on 27.04.20.
//  Copyright © 2020 ia. All rights reserved.
//

import SwiftUI

struct UserInfoRow: View {
    var imageName: String
    var title: String
    var subtitle: String

    var body: some View {
        HStack() {
            Image(systemName: imageName).padding()
            VStack(alignment: .leading) {
                Text(title)
                Text(subtitle)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding([.leading, .trailing, .bottom])    }
}

struct UserInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoRow(imageName: "1", title: "test", subtitle: "subtest")
    }
}
