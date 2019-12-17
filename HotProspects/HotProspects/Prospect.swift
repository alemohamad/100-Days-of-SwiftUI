//
//  Prospect.swift
//  HotProspects
//
//  Created by Ale Mohamad on 17/12/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    let id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
}

class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    
    static let saveKey = "SavedData"
    
    init() {
        people = []
        
        let filename = getDocumentsDirectory().appendingPathComponent(Self.saveKey)
        
        do {
            let data = try Data(contentsOf: filename)
            people = try JSONDecoder().decode([Prospect].self, from: data)
        } catch {
            print("Can't load saved data")
        }
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func clearAll() {
        people.removeAll(keepingCapacity: true)
    }
    
    private func save() {
        do {
            let filename = getDocumentsDirectory().appendingPathComponent(Self.saveKey)
            let data = try JSONEncoder().encode(people)
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Can't save data in the documents directory")
        }
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
