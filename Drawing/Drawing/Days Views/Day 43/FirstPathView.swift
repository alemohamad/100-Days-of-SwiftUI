//
//  FirstPathView.swift
//  Drawing
//
//  Created by Ale Mohamad on 05/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct FirstPathView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
        }
//        .fill(Color.blue)
        .stroke(Color.red, lineWidth: 10)
//        .stroke(Color.orange, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
        .navigationBarTitle(Text("Path"), displayMode: .inline)
    }
}

struct FirstPathView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FirstPathView()
        }
    }
}
