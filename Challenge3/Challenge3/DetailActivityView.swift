//
//  DetailActivityView.swift
//  Challenge3
//
//  Created by Ale Mohamad on 09/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct DetailActivityView: View {
    @ObservedObject var activities: Activities
    
    var activity: Activity
    
    @State private var barTitle: String = ""
    @State private var completed: Int = 0
    
    var body: some View {
        Form {
            Section(header: Text("\(activity.description)")) {
                Stepper("Completed times: \(completed)", value: $completed)
            }
        }
        .navigationBarTitle(Text("\(barTitle)"), displayMode: .inline)
        .onAppear {
            self.barTitle = self.activity.title
            self.completed = self.activity.completed
        }
        .onDisappear {
            if let index = self.activities.items.firstIndex(where: { $0 == self.activity }) {
                self.activities.items.remove(at: index)
                var tempActivity = self.activity
                tempActivity.completed = self.completed
                self.activities.items.insert(tempActivity, at: index)
            }
        }
    }
}

struct DetailActivityView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailActivityView(activities: Activities(),
                               activity: Activity(title: "Title", description: "Description"))
        }
    }
}
