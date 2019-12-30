//
//  Facility.swift
//  SnowSeeker
//
//  Created by Ale Mohamad on 30/12/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct Facility: Identifiable {
    let id = UUID()
    var name: String
    
    static func icon(for facility: Facility) -> some View {
        let icons = [
            "Accommodation": "house",
            "Beginners": "1.circle",
            "Cross-country": "map",
            "Eco-friendly": "leaf.arrow.circlepath",
            "Family": "person.3"
        ]
        
        if let iconName = icons[facility.name] {
            let image = Image(systemName: iconName)
                .accessibility(label: Text(facility.name))
                .foregroundColor(.secondary)
            return image
        } else {
            fatalError("Unknown facility type: \(facility.name)")
        }
    }
    
    static func alert(for facility: Facility) -> Alert {
        let messages = [
            "Accommodation": "This resort has popular on-site accommodation.",
            "Beginners": "This resort has lots of ski schools.",
            "Cross-country": "This resort has many cross-country ski routes.",
            "Eco-friendly": "This resort has won an award for environmental friendliness.",
            "Family": "This resort is popular with families."
        ]
        
        if let message = messages[facility.name] {
            return Alert(title: Text(facility.name), message: Text(message))
        } else {
            fatalError("Unknown facility type: \(facility.name)")
        }
    }
}
