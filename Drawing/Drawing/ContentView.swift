//
//  ContentView.swift
//  Drawing
//
//  Created by Ale Mohamad on 05/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Day43View()) {
                    Image(systemName: "43.circle")
                    Text("Part 1")
                }
                NavigationLink(destination: Day44View()) {
                    Image(systemName: "44.circle")
                    Text("Part 2")
                }
                NavigationLink(destination: Day45View()) {
                    Image(systemName: "45.circle")
                    Text("Part 3")
                }
                NavigationLink(destination: Day46View()) {
                    Image(systemName: "46.circle")
                    Text("Part 4")
                }
            }
            .navigationBarTitle(Text("Drawing"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
