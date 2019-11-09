//
//  AddActivityView.swift
//  Challenge3
//
//  Created by Ale Mohamad on 09/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct AddActivityView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var activities: Activities
    
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationBarTitle("Add new activity")
            .navigationBarItems(trailing:
                Button("Save") {
                    let item = Activity(title: self.title, description: self.description)
                    self.activities.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView(activities: Activities())
    }
}
