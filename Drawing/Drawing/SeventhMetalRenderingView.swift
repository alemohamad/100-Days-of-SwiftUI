//
//  SeventhMetalRenderingView.swift
//  Drawing
//
//  Created by Ale Mohamad on 06/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                .inset(by: CGFloat(value))
//                    .strokeBorder(self.color(for: value, brightness: 1), lineWidth: 2)
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                        self.color(for: value, brightness: 1),
                        self.color(for: value, brightness: 0.5)
                    ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            }
        }
        .drawingGroup() // this enables the usage of Metal
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct SeventhMetalRenderingView: View {
    @State private var colorCycle = 0.0
    
    
    var body: some View {
        VStack {
            ColorCyclingCircle(amount: self.colorCycle)
                .frame(width: 300, height: 300)
            
            Slider(value: $colorCycle)
        }
        .navigationBarTitle(Text("Metal rendering"), displayMode: .inline)
    }
}

struct SeventhMetalRenderingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SeventhMetalRenderingView()
        }
    }
}
