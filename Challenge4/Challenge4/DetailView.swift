//
//  DetailView.swift
//  Challenge4
//
//  Created by Ale Mohamad on 24/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var users: Users
    
    var user: User
    
    var body: some View {
        Form {
            Section {
                Text(user.company)
                Text(user.email)
                Text(user.address)
            }
            
            Section(header: Text("About")) {
                Text(user.about)
            }
            
            Section(header: Text("Registration Date")) {
                Text("\(user.formattedRegisteredDate)")
            }
            
            Section(header: Text("Tags")) {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(user.tags, id: \.self) { tag in
                            Text(tag)
                                .foregroundColor(Color.white)
                                .padding(.horizontal, 15)
                                .padding(.vertical, 5)
                                .background(
                                    Capsule()
                                        .fill(Color.red)
                                )
                                .padding(.vertical, 10)
                        }
                    }
                }
            }
            
            Section(header: Text("Friends")) {
                List(user.friends) { friend in
                    UserCellView(user: self.users.findUser(byName: friend.name)!)
                }
            }
        }
        .navigationBarTitle(Text("\(user.name) (\(user.age))"), displayMode: .inline)
        .navigationBarItems(trailing:
            Rectangle()
                .foregroundColor(user.isActive ? Color.green : Color.red)
                .frame(width: 20, height: 20)
        )
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(users: Users(), user: User(id: "50a48fa3-2c0f-4397-ac50-64da464f9954", isActive: false, name: "Alford Rodriguez", age: 21, company: "Imkan", email: "alfordrodriguez@imkan.com", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.", registered: Date(), tags: ["one", "two", "three"], friends: [Friend(id: "", name: "asd"), Friend(id: "", name: "asd")]))
        }
    }
}
