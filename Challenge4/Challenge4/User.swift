//
//  User.swift
//  Challenge4
//
//  Created by Ale Mohamad on 24/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import Foundation

struct User: Codable, Identifiable, Equatable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.name == rhs.name
    }
    
    var formattedRegisteredDate: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd,yyyy"
            return dateFormatter.string(from: registered)
        }
    }
}
