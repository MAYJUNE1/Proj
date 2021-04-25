//
//  RecipeListView.swift
//  Recipe
//
//  Created by LIM MEI TING on 24/04/2021.
//

import SwiftUI

struct RecipeListView: View {
    
    var items: [RecipeModel]
    var categorySelected : String
    
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(entity: Recipe.entity(), sortDescriptors: [])
    
    var recipes: FetchedResults<Recipe>
    
    @State private var draftProfile = Profile.default
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    let persistenceController = PersistenceController.shared
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(items.filter { $0.category == categorySelected }) { recipes in
                        NavigationLink(destination: RecipeDetails(recipe: recipes)) {
                            RecipeItem(recipe: recipes)
                        }
                    }
                    
                    ForEach(recipes) { recipe in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(recipe.name)
                            }
                            Spacer()
                        }
                        .frame(height: 50)
                    }
                }.padding(.trailing, 10)
                .padding(.leading, 10)
            }
            
            VStack{
                Spacer()
                HStack {
                    NavigationLink(
                        destination: RecipeEditPage().environment(\.managedObjectContext, persistenceController.container.viewContext)
                    ){
                        
                        HStack {
                            Image(systemName: "plus")
                                .font(.headline)
                            Text("Add My Recipe")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(10)
                    }
                    
                }
            }.padding(.bottom,10)
        }.navigationBarTitle("", displayMode: .inline)
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var recipes = ModelData().recipes
    static var previews: some View {

        RecipeListView(
            items: Array(recipes.prefix(1)), categorySelected: "1"
        )
    }
}
