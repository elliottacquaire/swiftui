//
//  Navigations.swift
//  Fuck
//
//  Created by Elliott on 2020/12/14.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import SwiftUI

struct Navigations: View {
    @State private var selection: String? = nil
    
    var body: some View {
        NavigationView
        {
            VStack
            {
                Text("Content View")
                Spacer()
                Button("Press to goto 2nd view", action: { self.selection = "Second" })
                Button("Press to goto 3rd view", action: { self.selection = "Third" })
                Button("Press to goto 4th view", action: { self.selection = "Forth" })
                Spacer()
            }
            .background(Group {
                    NavigationLink(destination: Text("Second View"), tag: "Second", selection: $selection) { EmptyView() }
                    NavigationLink(destination: Text("Third View"),  tag: "Third",  selection: $selection) { EmptyView() }
                    NavigationLink(destination: Text("Forth View"),  tag: "Forth",  selection: $selection) { EmptyView() }
            })
                .navigationBarTitle("Home")
        }
    }
}

struct Navigations_Previews: PreviewProvider {
    static var previews: some View {
        Navigations()
    }
}
