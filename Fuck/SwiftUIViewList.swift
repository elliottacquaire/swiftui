//
//  SwiftUIViewList.swift
//  Fuck
//
//  Created by Elliott on 2020/12/10.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import SwiftUI

struct SwiftUIViewList: View {
    var someInts = [Int](repeating: 0, count: 3)
    var someInts1:[Int] = [10, 20, 30]
    var someStrs1 = [String](repeating: "aaaa", count:10)
    var someStrs = [String]()
     var some1:[String] = ["10", "20", "30","40"]
    
    var body: some View {
        NavigationView{
            List(some1,id: \.self) { item in
                NavigationLink(destination: SwiftListDetail()) {
                    SwiftListItem(datt : item)
                    
                }
            } .navigationBarTitle(Text("Landmarks"), displayMode: .inline)
        }
        
    }
}

struct SwiftUIViewList_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewList()
    }
}

func tttt(){
//    for item in someStrs {
//          print(item)
//       }
//    someStrs.append("Apple")
//    someStrs.append("Amazon")
//    someStrs.append("Runoob")
}
