//
//  ResortDetailsView.swift
//  SnowSeeker
//
//  Created by Ale Mohamad on 29/12/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct ResortDetailsView: View {
    let resort: Resort
    
    var body: some View {
        Group {
            Text("Size: \(resort.sizeFormatted)").layoutPriority(1)
            Spacer().frame(height: 0)
            Text("Price: \(resort.priceFormatted)").layoutPriority(1)
        }
    }
}

struct ResortDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ResortDetailsView(resort: Resort.example)
    }
}
