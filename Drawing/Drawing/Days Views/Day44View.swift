//
//  Day44View.swift
//  Drawing
//
//  Created by Ale Mohamad on 07/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct Day44View: View {
    var body: some View {
        List {
            NavigationLink(destination: FifthTransformingShapeView()) {
                Image(systemName: "5.circle.fill")
                Text("TransformingShape")
            }
            NavigationLink(destination: SixthImagePaintView()) {
                Image(systemName: "6.circle.fill")
                Text("ImagePaint")
            }
            NavigationLink(destination: SeventhMetalRenderingView()) {
                Image(systemName: "7.circle.fill")
                Text("Metal rendering")
            }
        }
        .navigationBarTitle(Text("Day 44"), displayMode: .inline)
    }
}

struct Day44View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Day44View()
        }
    }
}
