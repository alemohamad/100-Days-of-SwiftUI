//
//  Users.swift
//  Challenge4
//
//  Created by Ale Mohamad on 24/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import Foundation

class Users: ObservableObject {
    @Published var items = [User]()
    
    init() {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let decodedUsers = try decoder.decode([User].self, from: data)
                DispatchQueue.main.async {
                    self.items = decodedUsers
                }
            } catch let error {
                print("error: \(error)")
            }
        }.resume()
    }
    
    func findUser(byName name: String) -> User? {
        if let user = items.first(where: { $0.name == name }) {
            return user
        }
        
        return items.first
    }
}
