//
//  PodcastPlayer.swift
//  Fuck
//
//  Created by Elliott on 2020/12/14.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import Foundation

//UserData不可以定义为struct，只能是class，因为它要继承ObservableObject
//UserData类从ObservableObject类继承而来
final class PodcastPlayer : ObservableObject{
    // @Published表示我们要把number广播出去
    @Published private(set) var isPlaying: Bool = false

       func play() {
           isPlaying = true
       }

       func pause() {
           isPlaying = false
       }
}
