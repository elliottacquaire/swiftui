//
//  DataLand.swift
//  Fuck
//
//  Created by Elliott on 2020/12/21.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import Foundation

struct DataLand : Hashable {
    var name : String
    var id : Int
    var isFavorite = false
    
    init(name : String,id: Int) {
        self.name = name
        self.id = id
    }
}
