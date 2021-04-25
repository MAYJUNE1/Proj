//
//  RecipeItem.swift
//  Recipe
//
//  Created by LIM MEI TING on 24/04/2021.
//

import SwiftUI

struct RecipeItem: View {
    var recipe: RecipeModel
    
    var body: some View {
        ZStack (alignment: .top) {
            recipe.image
                .resizable()
                .clipped()
            VStack {
                Text(recipe.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                HStack{
                    Image(systemName: "timer")
                    Text(recipe.prepTime)
                        .font(.caption)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)
            }
            .padding(.all, 5)
            
        }
        .frame(width: (UIScreen.main.bounds.width/2)-20, height: 240)
        .cornerRadius(5)
    }
}

struct RecipeItem_Previews: PreviewProvider {
    static var previews: some View {
        RecipeItem(recipe: ModelData().recipes[0])
    }
}
