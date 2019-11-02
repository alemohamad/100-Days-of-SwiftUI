//
//  NumberView.swift
//  Challenge2
//
//  Created by Ale Mohamad on 02/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct MultiplicationView: View {
    var number: Int
    var completion: (_ pos: Int) -> ()

    var body: some View {
        VStack {
            Button(action: {
                self.completion(self.number)
            }) {
                VStack {
                    Image("character_\(number)")
                        .renderingMode(.original)
                    Text("\(number)")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 20.0, alignment: .center)
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}
