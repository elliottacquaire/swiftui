//
//  CircleView.swift
//  Fuck
//
//  Created by Elliott on 2020/12/10.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import SwiftUI

struct CircleView: View {
    var body: some View {
      Image("rainbowlake")
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 7)
         .frame(width: 50, height: 50)
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}
