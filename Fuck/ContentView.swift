//
//  ContentView.swift
//  Fuck
//
//  Created by Elliott on 2020/12/10.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import SwiftUI

/**
 一个View中不同存在超过十个子View，这是由SwiftUI的底层逻辑决定的
 Group就是用来解决这个问题的
 Group {
           Text("Line")
           Text("Line")
           Text("Line")
           Text("Line")
           Text("Line")
           Text("Line")
       }
 */
struct ContentView: View {
    
//    @Binding var showing :Bool
    
   @State  var flag : Bool = true
    
    var body: some View {
        //HStack/VStack   HStack 和 ZStack 的非常类似安卓的 LinerLayout，算法也同 Flex 布局比较相似
        HStack(alignment: .top, spacing: 1){
            //奇怪的现象，切换view只是部分 感觉是NavigationView问题
            NavigationView{
                VStack{
                    NavigationLink(destination: TabViewDis()){
                        Text("*****")
                        Text("5 stars ")
                    }
                    
                }.font(.caption)
                    .edgesIgnoringSafeArea(.top)
            }.navigationBarTitle("threes")
            
            
            VStack(alignment: .leading){
                HStack {
                    Text("Avocado Toast").font(.title)
                    Spacer()
                    Image("turtlerock")
                }
                Text("Ingredients: Avocado, Almond Butter, Bread, Red Pepper Flakes")
                    .font(.caption)
                    .lineLimit(1)
                
                Text("Hello, World!")
                    .bold()
                    .padding(10)
                    .background(Color.green)
                
            }
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .padding()
                    //                .frame(width: 300.0, height: 30.0)
                    .background(Color.green)
                
                
                Button(action: {
                    print("click on---")
//                     self.showing = false
                }) {
                    HStack {
                        Text("click on").font(.title)
                        
                    }
                }.padding(10)
                    .background(Color.gray)
                
                
                Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                    /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
                }.frame(width: 50, height: 20)
                
                HStack {
                    Text("click on").font(.title)
                    Spacer()
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Text("California")
                        .font(.subheadline)
                }
                
                //                NavigationView{
                //                    NavigationLink(destination: TabViewDis()){
                //                                        CircleView()
                //                                   }.navigationBarTitle("ssss")
                //                }
                NavigationLink(destination: TabViewDis()){
                    CircleView()
                }.navigationBarTitle("three")
                    //右边弹出 .navigationViewStyle(StackNavigationViewStyle())
                .navigationViewStyle(DoubleColumnNavigationViewStyle())
                    //隐藏包括标题和返回键在内的所有系统导航栏
//                       .navigationBarHidden(true)
                       //只隐藏系统导航栏中的返回键
//                       .navigationBarBackButtonHidden(true)
                
                
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
