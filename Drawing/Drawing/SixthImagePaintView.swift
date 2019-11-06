//
//  SixthImagePaintView.swift
//  Drawing
//
//  Created by Ale Mohamad on 06/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct SixthImagePaintView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .frame(width: 300, height: 300)
//                .background(Color.red)
//                .border(Color.red, width: 30)
//                .background(Image("Example"))
                .border(ImagePaint(image: Image("Example"), scale: 0.2), width: 30)
//                .border(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.1), width: 30)
            Capsule()
                .strokeBorder(ImagePaint(image: Image("Example"), scale: 0.1), lineWidth: 20)
                .frame(width: 300, height: 200)
        }
        .navigationBarTitle(Text("ImagePaint"), displayMode: .inline)
    }
}

struct SixthImagePaintView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SixthImagePaintView()
        }
    }
}
