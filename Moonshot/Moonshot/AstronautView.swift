//
//  AstronautView.swift
//  Moonshot
//
//  Created by Ale Mohamad on 03/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var astroMissions = [Mission]()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                    .resizable()
                    .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                }
                
                ForEach(self.astroMissions) { mission in
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 44, height: 44)
                            .accessibility(hidden: true)
                        
                        VStack(alignment: .leading) {
                            Text(mission.displayName)
                                .font(.headline)
                            Text(mission.formattedLaunchDate)
                        }
                        .accessibilityElement(children: .ignore)
                        .accessibility(label: Text("\(mission.displayName). \(mission.formattedLaunchDate)"))
                        
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    
    init(astronaut: Astronaut) {
        self.astronaut = astronaut
        
        var matches = [Mission]()
        
        for mission in missions {
            if let _ = mission.crew.first(where: { $0.name == astronaut.id }) {
                matches.append(mission)
            }
        }
        
        self.astroMissions = matches
    }
}

struct AstronautView_Previews: PreviewProvider {
    static var astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        NavigationView {
            AstronautView(astronaut: astronauts[13])
        }
    }
}
