//
//  SecondPathShapeView.swift
//  Drawing
//
//  Created by Ale Mohamad on 05/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct SecondPathShapeView: View {
    var body: some View {
        Triangle()
//            .fill(Color.red)
            .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(width: 300, height: 300)
            .navigationBarTitle(Text("Shape Triangle"), displayMode: .inline)
    }
}

struct SecondPathShapeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SecondPathShapeView()
        }
    }
}
