//
//  CategoryView.swift
//  Recipe
//
//  Created by LIM MEI TING on 24/04/2021.
//

import SwiftUI

struct CategoryItem: View {
    var category: RecipeCategory
    
    var body: some View {
        VStack {
            Text(category.name)
                .foregroundColor(.black)
        }
        .frame(width: 100, height: 100)
        .background(Color(red: category.color.red / 255, green: category.color.green / 255, blue: category.color.blue / 255))
        .cornerRadius(5)
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(category: ModelData().recipesCategory[0])
    }
}
