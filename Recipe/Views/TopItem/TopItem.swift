//
//  CommonItem.swift
//  Recipe
//
//  Created by LIM MEI TING on 24/04/2021.
//

import SwiftUI

struct TopItem: View {
    var recipe: RecipeModel
    
    var body: some View {
        VStack(alignment: .leading) {
            recipe.image
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(recipe.name)
                .font(.body)
            HStack{
                Image(systemName: "heart.fill")
                Text(String(recipe.rating))
                    .font(.caption)
                
                Image(systemName: "message")
                Text(recipe.comments)
                    .font(.caption)
            }
        }
        .padding(.leading, 15)
    }
}

struct TopItem_Previews: PreviewProvider {
    static var previews: some View {
        TopItem(recipe: ModelData().recipes[0])
    }
}
