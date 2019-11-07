//
//  Day43View.swift
//  Drawing
//
//  Created by Ale Mohamad on 07/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct Day43View: View {
    var body: some View {
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
        .navigationBarTitle(Text("Day 43"), displayMode: .inline)
    }
}

struct Day43View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Day43View()
        }
    }
}
