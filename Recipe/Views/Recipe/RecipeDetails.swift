//
//  RecipeDetails.swift
//  Recipe
//
//  Created by LIM MEI TING on 24/04/2021.
//

import SwiftUI

struct RecipeDetails: View {
    
    var recipe: RecipeModel
    
    var body: some View {
        ScrollView {
            recipe.image
                .resizable()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Image(systemName: "heart.fill")
                    Text(String(recipe.rating))
                        .font(.caption)
                    
                    Image(systemName: "message")
                    Text(recipe.comments)
                        .font(.caption)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Text(recipe.desc)
                
                Divider()
                
                Text("Ingredient")
                    .font(.title2)
                
                ForEach(recipe.ingredient) { details in
                    HStack {
                        Text(details.name)
                        Spacer()
                        //Text("500g")
                    }.font(.body)
                    .foregroundColor(.secondary)
                }
                
                Divider()
                
                Text("Steps")
                    .font(.title2)
                
                ForEach(recipe.step) { step in
                    HStack {
                        Text(step.desc)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }.font(.body)
                    .padding(.all, 5)
                    .border(Color.green)
                    //.frame(minWidth: 0, maxWidth: .infinity)
                }
            }
            .padding(.all, 10)
        }
        .navigationBarTitle(recipe.name, displayMode: .large)
        .toolbar {
            Button(action: {
                
            }) {
                Text("Edit")
            }
        }
    }
}

struct RecipeDetails_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetails(recipe: ModelData().recipes[0])
    }
}
