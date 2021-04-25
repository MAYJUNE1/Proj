//
//  RecipeModel.swift
//  Recipe
//
//  Created by LIM MEI TING on 25/04/2021.
//

import Foundation
import SwiftUI

struct RecipeModel: Hashable, Codable, Identifiable {
    var id : String
    var name: String
    var category: String
    var desc: String
    var rating: Double
    var comments : String
    var prepTime: String
    var ingredient: [Ingredients]
    var step: [Steps]
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
}

struct Ingredients: Hashable, Codable, Identifiable {
    var id : String
    var name : String
}

struct Steps: Hashable, Codable, Identifiable {
    var id : String
    var desc : String
}

