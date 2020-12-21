//
//  TabViewDis.swift
//  Fuck
//
//  Created by Elliott on 2020/12/11.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import SwiftUI

/**
 @State只适合于struct，当然这个struct可以是常用的Double, Int, String等类型，也可以是自己定义的类型。但@State，不适合于class。struct是实例类型，class是引用类型，导致了他们俩在处理时有所不同
 当 View 修改自身的属性时，使用@State。当 View 需要修改父 View 的属性时，使用@Binding。
 */
struct TabViewDis: View {
    @EnvironmentObject var action: NavigationAction
    @ObservedObject var update = DelayedUpdater()
     @EnvironmentObject var player: PodcastPlayer
     @Environment(\.locale) var locale: Locale
    
    @State var temperature: Double = 0

    
    var body: some View {
        VStack {
            //displayMode是TitleDisplayMode枚举的值，它有三种值：
            //automatic：从前一个导航栏继承显示模式
            //            inline：展示标准导航条的title样式
            //            large：即系统默认的样式，居左大标题
            
            TabView{
                //添加一个文本视图，作为标签视图的第一个标签项。
                VStack{
                    NavigationView{
                        Text("Hello World!").navigationBarTitle("TEST",displayMode: .inline)
                            //单独写直显示一个，分开写两个前面一个会被覆盖，需要写在一起
                            //                            .navigationBarItems(leading: Button("left"){   print("leading button clicked!")})
                            //                         .navigationBarItems(trailing: Button("right"){   print("trailing button clicked!")})
                            .navigationBarItems(
                                leading: Button("left"){   print("leading button clicked!")},
                                trailing: Button("right"){
                                    if self.player.isPlaying {
                                                           self.player.pause()
                                        print("trailing button clicked!\(self.player.isPlaying)")
                                                       } else {
                                                           self.player.play()
                                        print("trailing button clicked!\(self.player.isPlaying)")
                                                       }
                                    
                                    
                            })
                    }
                    Text("Value is: \(update.value)")
                    Text("The home page.--\(update.valueTest)").font(.system(size: 36))
                }
                    //接着来设置文本视图的选项卡，只有设置了选项卡，才会在屏幕底部的选项卡列表里显对应的标签。
                    .tabItem({
                        Image(systemName: "house")
                        Text("Home") })
                    .tag(0)
                
                
                //继续添加另一个文本视图，作为标签视图的第二个标签项。
                VStack{
                    NavigationLink(destination: StateView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)){
                        Text("The settings page \(locale.identifier)").navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                        }
                    .buttonStyle(PlainButtonStyle())
                    //使用波纹管修改器将默认按钮样式更改为普通样式
                    
                    NavigationLink(destination: StateView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)){
                        Button("Click me transfer"){
                            print("click transfer")
                        }
                    }
                    //                    .sheet(isPresented: true, content: {MapView()})
                    VStack(alignment: .leading) {
                        Text("Hello, world!")
                            .alignmentGuide(.leading) { d in d[.trailing] }
                        Text("This is a longer line of text")
                    }
                    
                    VStack(alignment: .leading) {
                           ForEach(0..<10) { position in
                               Text("Number \(position)")
                                   .alignmentGuide(.leading) { _ in CGFloat(position) * -10 }
                           }
                       }
                       .background(Color.red)
                       .frame(width: 400, height: 400)
                       .background(Color.blue)

                }
                .font(.system(size: 36))
                .tabItem({
                    Image(systemName: "gear")
                    Text("Settings")
                })
                    .tag(1)
                
                VStack{
                    //添加一个步进器视图，接着将依次设置步进器的递增、递减事件和数值标签。
                                   Stepper(onIncrement: {
                                       self.temperature += 1
                                   }, onDecrement: {
                                       self.temperature -= 1
                                   }, label: { Text("Temperature: \(Int(temperature))") })
                                   
                                   Stepper(onIncrement: {
                                       self.temperature += 1
                                   }, onDecrement: {
                                       self.temperature -= 1
                                   }, onEditingChanged: { (item) in
                                       print(item)
                                   }, label: { Text("Temperature: \(Int(temperature))") })

                }.padding()
                .tabItem({
                    Image(systemName: "gear")
                    Text("Sesss")
                })
                    .tag(2)
                
                VStack{
                    Group{
                        Image(systemName: "star.fill")
                                           .foregroundColor(.yellow)
                    }
                }.tabItem({
                    Image(systemName: "star")
                    Text("Star")
                    }).tag(3)
                
                
            }
        }
        //            NavigationView{
        //                Text("Hello World!").navigationBarTitle("TEST",displayMode: .inline)
        //            }
        
        //            NavigationView{
        //                Text("Hello World!") .navigationBarTitle("TEST",displayMode: .inline)
        //                .navigationBarHidden(false)
        //                .navigationBarItems(leading: Button("left"){})
        //                .navigationBarItems(trailing: Button("right"){})
        //            }
        //            .navigationBarItems(leading: Button("left"){}, trailing: Button("right"){})
        //            .navigationBarTitle("TEST",displayMode: .inline)
        //            .navigationBarItems(leading: Button("Left"){
        //                 print("leading button clicked!")
        //            }, trailing: Button("Right"){
        //                 print("trailing button clicked!")
        //            }
        
        //                  Rectangle()
        //                      .frame(width: 640, height: 180)
        //                      .foregroundColor(.red).onTapGesture(count: 1, perform: {
        //                          self.action.backToRoot = false
        //                      })
        //                  Spacer()
        //              }
        //              .edgesIgnoringSafeArea(.all)
        //              .navigationTitle("ThirdView")
        
    }
}
//同样我们要在SceneDelegate.swift做修改在rootView: //contentView后.environmentObject(UserData())。这样才会在iOSsimulator和preview里都运行正确。

struct TabViewDis_Previews: PreviewProvider {
    static var previews: some View {
        TabViewDis()
//         ContentView().environmentObject(UserData()) //这里必须传入一个UserData的实例。
    }
}
