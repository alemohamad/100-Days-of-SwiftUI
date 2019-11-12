//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Ale Mohamad on 12/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Image("cupcakes")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width)
                
                Text("Your order is $\(self.order.cost, specifier: "%.2f")")
                    .font(.title)
                
                Button("Place order") {
                    //
                }
                .padding()
            }
        }
        .navigationBarTitle(Text("Check out"), displayMode: .inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckoutView(order: Order())
        }
    }
}
