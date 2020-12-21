//
//  SwiftListItem.swift
//  Fuck
//
//  Created by Elliott on 2020/12/10.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import SwiftUI

struct SwiftListItem: View {
    //    var dataTest : DataTest
    var datt : String
    
    var body: some View {
        HStack {
            //            dataTest.name(forSize: 50)
            CircleImage(image: Image("rainbowlake"))
            Text(datt)
            Spacer()
//            if landmark.isFavorite {
//                           Image(systemName: "star.fill")
//                       }
            Image(systemName: "star.fill")
                               .foregroundColor(.yellow)
        }
    }
}

struct SwiftListItem_Previews: PreviewProvider {
    static var previews: some View {
        SwiftListItem(datt : "sdfsd")
    }
}
