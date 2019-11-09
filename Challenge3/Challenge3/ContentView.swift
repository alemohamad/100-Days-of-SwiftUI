//
//  ContentView.swift
//  Challenge3
//
//  Created by Ale Mohamad on 09/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var activities = Activities()
    
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities.items) { item in
                    NavigationLink(destination: DetailActivityView(activities: self.activities, activity: item)) {
                        Text(item.title)
                            .font(.headline)
                        Spacer()
                        Text("\(item.completed)")
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("Activities")
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                    Button(action: {
                        self.showingAddActivity = true
                    }) {
                        Image(systemName: "plus")
                    }
            )
            .sheet(isPresented: $showingAddActivity) {
                AddActivityView(activities: self.activities)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
