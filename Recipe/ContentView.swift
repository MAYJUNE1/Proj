//
//  ContentView.swift
//  Recipe
//
//  Created by LIM MEI TING on 24/04/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Recipe.id, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Recipe>

    @State private var selection: Tab = .featured

    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            DiscoverHome()
                .tabItem {
                    Label("Discover", systemImage: "star")
                }
                .tag(Tab.featured)

            UserHome()
                .tabItem {
                    Label("My Recipe", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
        
    }

    private func addItem() {
        withAnimation {
            let newItem = Recipe(context: viewContext)
            newItem.id = "R001"
            
            let newIngredient = Ingredient(context: viewContext)
            newIngredient.id = "1"
            newIngredient.name = "asdas"
            
            newItem.recipeIngredient = newIngredient
            

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(ModelData())
    }
}
