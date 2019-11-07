//
//  EightSpecialEffectsBlurView.swift
//  Drawing
//
//  Created by Ale Mohamad on 07/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct EightSpecialEffectsBlurView: View {
    @State private var amount: CGFloat = 0.0
    
    var body: some View {
        VStack {
            Image("alemohamad")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .cornerRadius(8.0)
                .saturation(Double(amount))
                .blur(radius: (1 - amount) * 20)
            
            Slider(value: $amount)
                    .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("Special Effects: Blur", displayMode: .inline)
    }
}

struct EightSpecialEffectsBlurView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EightSpecialEffectsBlurView()
        }
    }
}
