//
//  CommonItemRow.swift
//  Recipe
//
//  Created by LIM MEI TING on 24/04/2021.
//

import SwiftUI

struct TopItemRow: View {
    
    var items: [RecipeModel]
    
    var body: some View {
        Text("Top Picks")
            .font(.headline)
            .padding(.leading, 15)
            .padding(.top, 5)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 0) {
                ForEach(items.filter { $0.rating > 5 }) { recipes in
                    NavigationLink(destination: RecipeDetails(recipe: recipes)) {
                        TopItem(recipe: recipes)
                    }
                }
            }
        }
        .frame(height: 230)    }
}

struct CommonItemRow_Previews: PreviewProvider {
    static var recipes = ModelData().recipes
    static var previews: some View {
        TopItemRow(items: recipes)
    }
}
