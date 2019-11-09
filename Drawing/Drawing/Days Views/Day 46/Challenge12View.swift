//
//  Challenge12View.swift
//  Drawing
//
//  Created by Ale Mohamad on 08/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY * 1/3))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY * 1/3))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY * 2/3))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY * 2/3))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY * 1/3))
        
        return path
    }
}

struct Challenge12View: View {
    @State private var thickness: CGFloat = 10.0
    @State private var isBig = false
    
    var body: some View {
        Arrow()
            .stroke(Color.blue, style: StrokeStyle(lineWidth: thickness, lineCap: .round, lineJoin: .round))
            .frame(width: 250, height: 200)
            .onTapGesture {
                withAnimation {
                    self.isBig.toggle()
                    self.thickness = self.isBig ? 30.0 : 10.0
                }
            }
            .navigationBarTitle("Challenges 1 & 2", displayMode: .inline)
    }
}

struct Challenge12View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Challenge12View()
        }
    }
}
