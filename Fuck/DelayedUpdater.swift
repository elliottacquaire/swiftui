//
//  DelayedUpdater.swift
//  Fuck
//
//  Created by Elliott on 2020/12/14.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import Foundation

/**
 移除 @Published，你会看到 UI 不再变化了。虽然幕后的 asyncAfter() 仍然在执行，但由于没有变化通知发出，UI 不再刷新。
 我们可以通过手动发送我前面提到的 objectWillChange 来解决。这种方式能让我们在任意时刻发送变化通知，而不用依赖于 @Published 的自动行为。
两者等价
 var value = 0 {
     willSet {
         objectWillChange.send()
     }
 }
 */
class DelayedUpdater: ObservableObject {
    @Published var value = 0
    
    var valueTest = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        for i in 1...10{
            DispatchQueue.main.asyncAfter(deadline: .now()+Double(i)) {
                self.value += 1
                self.valueTest += 1
            }
        }
    }
}
