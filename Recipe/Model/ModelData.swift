//
//  ModelData.swift
//  Recipe
//
//  Created by LIM MEI TING on 25/04/2021.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var recipes: [RecipeModel] = load("recipeData.json")
    @Published var recipesCategory: [RecipeCategory] = load("recipeCategory.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
