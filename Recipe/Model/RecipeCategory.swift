//
//  RecipeModel.swift
//  Recipe
//
//  Created by LIM MEI TING on 25/04/2021.
//

import Foundation
import SwiftUI

struct RecipeCategory: Hashable, Codable, Identifiable {
    var id : String
    var name: String
    var color: CatColor
}

struct CatColor: Hashable, Codable {
    var red : Double
    var green : Double
    var blue : Double
}

