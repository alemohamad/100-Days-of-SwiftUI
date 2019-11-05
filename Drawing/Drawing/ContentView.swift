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
                NavigationLink(destination: FirstPathView()) {
                    Image(systemName: "1.circle.fill")
                    Text("Path")
                }
                NavigationLink(destination: SecondPathShapeView()) {
                    Image(systemName: "2.circle.fill")
                    Text("Shape Triangle")
                }
                NavigationLink(destination: ThirdPathShapeView()) {
                    Image(systemName: "3.circle.fill")
                    Text("Shape Arc")
                }
                NavigationLink(destination: FourthShapeView()) {
                    Image(systemName: "4.circle.fill")
                    Text("InsettableShape")
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
