//
//  Day45View.swift
//  Drawing
//
//  Created by Ale Mohamad on 07/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct Day45View: View {
    var body: some View {
        List {
            NavigationLink(destination: EightSpecialEffectsView()) {
                Image(systemName: "8.circle.fill")
                Text("Special Effects: Multiply")
            }
            NavigationLink(destination: EightSpecialEffectsScreenView()) {
                Image(systemName: "9.circle.fill")
                Text("Special Effects: Screen")
            }
            NavigationLink(destination: EightSpecialEffectsBlurView()) {
                Image(systemName: "10.circle.fill")
                Text("Special Effects: Blur")
            }
            NavigationLink(destination: NinthAnimatingShapesView()) {
                Image(systemName: "11.circle.fill")
                Text("Animating Simple Shapes")
            }
            NavigationLink(destination: TenthAnimatingComplexShapesView()) {
                Image(systemName: "12.circle.fill")
                Text("Animating Complex Shapes")
            }
            NavigationLink(destination: EleventhSpirographView()) {
                Image(systemName: "13.circle.fill")
                Text("Spirograph")
            }
        }
        .navigationBarTitle(Text("Day 45"), displayMode: .inline)
    }
}

struct Day45View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Day45View()
        }
    }
}
