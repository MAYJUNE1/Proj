//
//  Recipe+CoreDataProperties.swift
//  Recipe
//
//  Created by LIM MEI TING on 25/04/2021.
//
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }

    @NSManaged public var id: String
    @NSManaged public var name: String
    @NSManaged public var category: String
    @NSManaged public var recipeIngredient: Ingredient

}

extension Recipe : Identifiable {

}
