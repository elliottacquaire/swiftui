//
//  StateView.swift
//  Fuck
//
//  Created by Elliott on 2020/12/13.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import SwiftUI

struct StateView: View {
    
    let rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)
    
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    
    @State var showAlert = false
    
    func computeScore() -> Int {
        let rDiff = rGuess - rTarget
        let gDiff = gGuess - gTarget
        let bDiff = bGuess - bTarget
        let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
        return Int((1.0 - diff) * 100.0 + 0.5)
    }
    
    var body: some View {
        
        VStack {
            HStack {
                // Target Color Block
                VStack {
                    Rectangle().foregroundColor(Color(red: rTarget, green: gTarget, blue: bTarget, opacity: 1.0))
                    Text("Match this color")
                }
                // Guess Color Block
                VStack {
                    Rectangle().foregroundColor(Color(red: rGuess, green: gGuess, blue: bGuess, opacity: 1.0))
                    HStack {
                        Text("R: \(Int(rGuess * 255.0))")
                        Text("G: \(Int(gGuess * 255.0))")
                        Text("B: \(Int(bGuess * 255.0))")
                    }
                }
            }
            
            ColorSlider(value: $rGuess, textColor: .red)
            ColorSlider(value: $gGuess, textColor: .green)
            ColorSlider(value: $bGuess, textColor: .blue)
            
            Button(action: {
                self.showAlert = true
            }) {
                Text("Hit Me!")
            }
            .alert(isPresented: $showAlert) { () -> Alert in
                Alert(title: Text("Your Score"), message: Text("\(computeScore())"))
            }
            
            VStack {
                Text("Placeholder")
            }
        }
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    //因为你告诉它这个value是binding的变量，所以不需要初始化
    //编译器知道value的值，是从别的地方来,可以把Binding看做C语言中的指针传递。
    var textColor: Color
    
    var body: some View {
        HStack {
            Text("0").foregroundColor(textColor)
            Slider(value: $value)
            //在这里改变value，会直接改变ContentView中的rGuess

            Text("255").foregroundColor(textColor)
        }
        .padding()
    }
}
