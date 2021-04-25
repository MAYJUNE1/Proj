//
//  CategoryList.swift
//  Recipe
//
//  Created by LIM MEI TING on 24/04/2021.
//

import SwiftUI

struct DiscoverHome: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView{
            List {
                CategoryRow(items: modelData.recipes, category: modelData.recipesCategory)
                    .listRowInsets(EdgeInsets())
                TopItemRow(items: modelData.recipes)
                    .listRowInsets(EdgeInsets())
                NewItemRow()
                    .listRowInsets(EdgeInsets())
                
            }
            .listStyle(InsetListStyle())
            .navigationTitle("Recipe")
        }
    }
}

struct DiscoverHome_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverHome()
    }
}
