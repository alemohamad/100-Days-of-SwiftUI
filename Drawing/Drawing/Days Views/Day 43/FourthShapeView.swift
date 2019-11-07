//
//  FourthShapeView.swift
//  Drawing
//
//  Created by Ale Mohamad on 05/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct FourthShapeView: View {
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(Color.red, lineWidth: 40)
            Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
                .strokeBorder(Color.blue, lineWidth: 40)
        }
        .navigationBarTitle(Text("InsettableShape"), displayMode: .inline)
    }
}

struct FourthShapeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FourthShapeView()
        }
    }
}
