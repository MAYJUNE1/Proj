//
//  Ingredient+CoreDataProperties.swift
//  Recipe
//
//  Created by LIM MEI TING on 25/04/2021.
//
//

import Foundation
import CoreData


extension Ingredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredient> {
        return NSFetchRequest<Ingredient>(entityName: "Ingredient")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?

}

extension Ingredient : Identifiable {

}
