//
//  FavoriteButton.swift
//  Fuck
//
//  Created by Elliott on 2020/12/21.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import SwiftUI

struct FavoriteButton: View {
     @Binding var isSet: Bool
    
    var body: some View {
        Button(action: {
            self.isSet.toggle()
               }) {
                   Image(systemName: isSet ? "star.fill" : "star")
                       .foregroundColor(isSet ? Color.yellow : Color.gray)
               }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
