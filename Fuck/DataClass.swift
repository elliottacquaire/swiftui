//
//  DataClass.swift
//  Fuck
//
//  Created by Elliott on 2020/12/15.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import Foundation

/**
 didSet 表示number被Set之后执行后面闭包的内容。类似地，还有willSet，表示在将要set number之前，执行闭包内容。在我们这个App里察觉不出来willSet和didSet的区别，因为执行的太快了，我们总是感觉滑动滑块时，数字立即就更新了，分不清谁先谁后。
 objectWillChange是ObservableObject定义的property，它也是一个struct，objectWillChange中有一个方法就是send()，用于向视图发送更新消息
 像C语言指针一样传递实例类型数据(struct)，用@State，@Binding。传递引用类型数据(class），用@ObservableObject，@ObservedObject，还要使用objectWillChange.send()
 像C语言全局变量一样，用ObservableObject，@EnvironmentObject，还要在主视图声名时，使用modifer：.environmentObject.
 
 很多数据其实并不是在View内部产生的，这些数据有可能是一些本地存储的数据，也有可能是网络请求的数据，这些数据默认是与 SwiftUI 没有依赖关系的，要想建立依赖关系就要用ObservableObject，与之配合的是@ObservedObject和@Published
 @Published用在ObservableObject内，一旦修饰的属性发送了变化，会自动触发ObservableObject的objectWillChange的send方法，刷新页面，SwiftUI 已经默认帮我实现好了，但也可以自己手动触发这个行为。
 
 @EnvironmentObject主要是为了解决跨组件（跨应用）数据传递的问题。组件层级嵌套太深，就会出现数据逐层传递的问题，@EnvironmentObject可以帮助组件快速访问全局数据，避免不必要的组件数据传递问题。使用@EnvironmentObject，SwiftUI 将立即在环境中搜索正确类型的对象。如果找不到这样的对象，则应用程序将立即崩溃

 SwiftUI 的界面不再像 UIKit 那样，用ViewController承载各种UIVew控件，而是一切皆View，所以可以把View切分成各种细粒度的组件，然后通过组合的方式拼装成最终的界面，这种视图的拼装方式大大提高了界面开发的灵活性和复用性，视图组件化并任意组合的方式是 SwiftUI 官方非常鼓励的做法。

 Property、 @State、 @Binding一般修饰的都是View内部的数据。
 @ObservedObject、 @EnvironmentObject一般修饰的都是View外部的数据：
 
 */
class DataClass:ObservableObject {//:用处有很多，可用来表示继承或遵守协议
    var number: Double = 0.0 {didSet {updateUI()}}
    func updateUI() {objectWillChange.send()}
}
