//
//  CategoryRow.swift
//  Recipe
//
//  Created by LIM MEI TING on 24/04/2021.
//

import SwiftUI

struct CategoryRow: View {
    
    @Environment(\.managedObjectContext) var context
    var items: [RecipeModel]
    var category: [RecipeCategory]

    var body: some View {
        Text("Categories")
            .font(.headline)
            .padding(.leading, 15)
            .padding(.top, 5)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 0) {
                ForEach(category) { category in
                    NavigationLink(destination: RecipeListView(items: items, categorySelected: category.id)) {
                        CategoryItem(category:category)
                    }
                }
            }
        }
        .frame(height: 130)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var recipes = ModelData().recipes
    static var category = ModelData().recipesCategory
    static var previews: some View {
        CategoryRow(items: recipes, category: category)
    }
}
