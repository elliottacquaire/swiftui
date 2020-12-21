//
//  CircleImage.swift
//  Fuck
//
//  Created by Elliott on 2020/12/10.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        image.clipShape(Circle())
//            .overlay(
//                Circle()
//                    .stroke(Color.white, lineWidth: 4)
//                    .shadow(radius: 10)
//                    .frame(width: 50, height: 50)
//        )
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
