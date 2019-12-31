//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Ale Mohamad on 30/12/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

class Favorites: ObservableObject {
    // the actual resorts the user has favorited
    private var resorts: Set<String>
    
    // the key we're using to read/write in UserDefaults
    private let saveKey = "Favorites"
    
    init() {
        // load our saved data
        if let savedSet = UserDefaults.standard.array(forKey: saveKey) as? [String] {
            resorts = Set(savedSet)
            return
        }
        
        // still here? Use an empty array
        self.resorts = []
    }
    
    // returns true if our set contains this resort
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    // adds the resort to our set, updates all views, and saves the change
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    // removes the resort from our set, updates all views, and saves the change
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func total() -> Int {
        resorts.count
    }
    
    func save() {
        // write out our data
        UserDefaults.standard.set(Array(resorts), forKey: saveKey)
    }
}
