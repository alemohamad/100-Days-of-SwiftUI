//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Ale Mohamad on 21/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?
    
    public var wrappedName: String {
        name ?? "Unknown Candy"
    }

}
