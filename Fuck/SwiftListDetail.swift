//
//  SwiftListDetail.swift
//  Fuck
//
//  Created by Elliott on 2020/12/10.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import SwiftUI

struct SwiftListDetail: View {
    @State var btn5State: Bool = false
    
    @State var isShow = false
    
    @EnvironmentObject var action: NavigationAction
    
    var body: some View {
        VStack{
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage(image: Image("stmarylake"))
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Button(action: {
                    print("click me first")
                    // 状态反转
                    self.btn5State.toggle()
                    buttonClickAction()
                }) {
                    HStack {
                        if self.btn5State{
                            //                         Image(self.btn5State ? "back" : "back2")
                            Image(systemName: "trash")
                                .renderingMode(.original)
                                .font(.title)
                            
                            
                            
                            
                        }else{
                            //                         Image(self.btn5State ? "back" : "back2")
                            Image(systemName: "trash")
                                .renderingMode(.original)
                                .font(.title)
                                .hidden()
                            
                            
                        }
                        
                        Text(self.btn5State ? "btn, 已选中" : "btn, 未选中")
                            .font(.title)
                            .padding(10)
                            .background(Color.purple)
                            .cornerRadius(40)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color.purple, lineWidth: 5)
                        )
                        
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(10)
                    //                    .background(Color.gray)
                    .background(self.btn5State ? Color.orange : Color.gray)
                    //                    .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                    .shadow(radius: 10)
                
                
                NavigationLink(destination: ContentView()){
                    Text("Turtle Rock --Next view  第一个界面")
                                       .font(.title)
                }//不显示title 便 不写字符串back
                .navigationBarTitle("second")
               
                /**
                 在IOS13后，苹果大部分内置程序在由底至上弹出时，都可以看见其上一级的View/Controller，但往往我们只想全屏当前的View/Controller，在UIKit中，我们修改modalPresentationStyle为fullScreen来实现全屏显示，而在SwiftUI中，我们不再使用sheet跳转，而改用fullScreenCover，来实现全屏显示，我们只需要将上例中的sheet修改为fullScreenCover，即可看到效果。
                 */
                //通过点击主界面的button按钮，弹出一个NextView，在NextView中，通过以下方法返回至MainView,sheet,popover
                Button("ACTION"){}.popover(isPresented: $btn5State, content: {
                    NextView()
                })
                
                HStack {
                    Image(systemName: "trash")
                        // 设置要跟随 frame 固定大小
                        .resizable()
                        // 渲染, 保持原图片
                        .renderingMode(.original)
                        // 设置图片固定大小, 60 x 60
                        .frame(width: 60, height: 60)
                        .cornerRadius(10)
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
            }
            .padding()
            
            Spacer()
        }
        
        
    }
}

struct SwiftListDetail_Previews: PreviewProvider {
    static var previews: some View {
        SwiftListDetail()
    }
}

struct NextView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 340, height: 280)
                .foregroundColor(.green)
                .onTapGesture(count: 1, perform: {
                    //在NextView中，通过以下方法返回至MainView
                self.presentationMode.wrappedValue.dismiss()
            })
//            Spacer()
        }.edgesIgnoringSafeArea(.bottom)
    }
}

func buttonClickAction(){
    print("first click me ! I am Button ")
}


