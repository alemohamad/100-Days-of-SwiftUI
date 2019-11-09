//
//  Activity.swift
//  Challenge3
//
//  Created by Ale Mohamad on 09/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import Foundation

struct Activity: Identifiable, Codable, Equatable {
    let id = UUID()
    let title: String
    let description: String
    var completed: Int = 0
    
    static func == (lhs: Activity, rhs: Activity) -> Bool {
        return lhs.title == rhs.title
    }
}
