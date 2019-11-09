//
//  Day46View.swift
//  Drawing
//
//  Created by Ale Mohamad on 08/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct Day46View: View {
    var body: some View {
        List {
            NavigationLink(destination: Challenge12View()) {
                Image(systemName: "14.circle.fill")
                Text("Challenges 1 & 2")
            }
            NavigationLink(destination: Challenge3View()) {
                Image(systemName: "15.circle.fill")
                Text("Challenge 3")
            }
        }
        .navigationBarTitle(Text("Day 46"), displayMode: .inline)
    }
}

struct Day46View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Day46View()
        }
    }
}
