//
//  ContentView.swift
//  Moonshot
//
//  Created by Ale Mohamad on 03/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showDates = true
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        
                        if self.showDates {
                            Text(mission.formattedLaunchDate)
                        } else {
                            Text(mission.listCrew)
                        }
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing: Button(showDates ? "Crew Names" : "Launch Dates") {
                self.showDates.toggle()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
