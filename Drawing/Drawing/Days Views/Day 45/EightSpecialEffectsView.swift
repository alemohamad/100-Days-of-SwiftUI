//
//  EightSpecialEffectsView.swift
//  Drawing
//
//  Created by Ale Mohamad on 07/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct EightSpecialEffectsView: View {
    @State private var isMultiplied = false
    
    var body: some View {
//        ZStack {
//            Image("alemohamad")
//                .resizable()
//                .scaledToFill()
//
//            Rectangle()
//                .fill(Color.red)
//                .blendMode(.multiply)
//        }
//        .frame(width: 400, height: 500)
//        .clipped()
        
        VStack {
            Image("alemohamad")
                .resizable()
                .scaledToFit()
                .colorMultiply(isMultiplied ? .red : .white)
            
            Toggle(isOn: $isMultiplied.animation()) {
                Text("Apply multiply effect")
            }
            .padding()
        }
        .navigationBarTitle("Special Effects: Multiply", displayMode: .inline)
    }
}

struct EightSpecialEffectsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EightSpecialEffectsView()
        }
    }
}
