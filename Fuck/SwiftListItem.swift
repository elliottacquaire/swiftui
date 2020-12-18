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
        }
    }
}

struct SwiftListItem_Previews: PreviewProvider {
    static var previews: some View {
        SwiftListItem(datt : "sdfsd")
    }
}
