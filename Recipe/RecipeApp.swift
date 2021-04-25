//
//  RecipeApp.swift
//  Recipe
//
//  Created by LIM MEI TING on 24/04/2021.
//

import SwiftUI

@main
struct RecipeApp: App {
    let persistenceController = PersistenceController.shared
    
    @Environment(\.managedObjectContext) var viewContext
    
    @StateObject var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
