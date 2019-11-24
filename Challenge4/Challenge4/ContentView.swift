//
//  ContentView.swift
//  Challenge4
//
//  Created by Ale Mohamad on 24/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var users = Users()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users.items) { user in
                    NavigationLink(destination: DetailView(users: self.users, user: user)) {
                        UserCellView(user: user)
                    }
                }
            }
            .navigationBarTitle(Text("FriendFace"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
