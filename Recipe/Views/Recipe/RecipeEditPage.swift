//
//  RecipeEditPage.swift
//  Recipe
//
//  Created by LIM MEI TING on 24/04/2021.
//

import SwiftUI

struct RecipeEditPage: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var ingDataList = ["Ingredient One"]
    @State var ingData = ""
    
    @State var stepDataList = ["Step one"]
    @State var stepData = " "
    
    @State var title = ""
    
    let persistenceController = PersistenceController.shared
    @Environment(\.managedObjectContext) var viewContext
    
    
    var body: some View {
        ScrollView{
            VStack (alignment: .leading){
                Image("icybay")
                    .resizable()
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                
                VStack(alignment: .leading) {
                    Text("Title")
                        .font(.title2)
                    TextField("Username", text: $title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding()
                
                Divider()
                
                VStack (alignment: .leading){
                    Text("Ingredients")
                        .font(.title2)
                    HStack {
                        TextField("Enter Ingredient", text: $ingData)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button("Add"){
                            if self.ingDataList.count < 5{
                                self.ingDataList.insert(self.ingData, at: 0)
                                self.ingData = ""
                            }
                        }
                    }
                    
                }.padding()
                
                List {
                    ForEach(ingDataList, id: \.self) { element in
                        Text(element)
                    }
                    .onDelete(perform: deleteIng)
                }.frame(height: CGFloat(self.ingDataList.count) * 50)
                
                
                Divider()
                
                VStack (alignment: .leading){
                    Text("Steps")
                        .font(.title2)
                    HStack {
                        TextEditor(text: $stepData)
                            .border(Color.gray, width: 1)
                        
                        Button("Add"){
                            
                            if self.stepDataList.count < 5{
                                self.stepDataList.insert(self.stepData, at: self.stepDataList.count)
                                self.stepData = " "
                            }
                        }
                    }
                    
                }.padding()
                
                List {
                    ForEach(stepDataList, id: \.self) { element in
                        VStack(alignment: .leading) {
                            Text("Step")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            HStack {
                                Text(element)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }.font(.body)
                            .padding(.all, 5)
                            .border(Color.green)
                        }
                    }
                    .onDelete(perform: deleteStep(at:))
                }.frame(height: CGFloat(self.ingDataList.count) * 100)
            }
        }.toolbar {
            Button(action: {
                let newRecipe = Recipe(context: self.viewContext)
                newRecipe.category = "1"
                newRecipe.name = self.title
                newRecipe.id = "R002"
                
                for index in 0..<ingDataList.count {
                    let newIng = Ingredient(context: self.viewContext)
                    newIng.id = "I0001"
                    newIng.name = ingDataList[index]
                    newRecipe.recipeIngredient = newIng
                }
                
                do {
                    try self.viewContext.save()
                    print("Recipe saved.")
                    self.presentationMode.wrappedValue.dismiss()
                } catch {
                    print("error")
                }
            }) {
                Text("Save")
            }
        }
    }
    
    func deleteIng(at offsets: IndexSet) {
        ingDataList.remove(atOffsets: offsets)
    }
    
    func deleteStep(at offsets: IndexSet) {
        stepDataList.remove(atOffsets: offsets)
    }
    
    
}

struct RecipeEditPage_Previews: PreviewProvider {
    static var previews: some View {
        RecipeEditPage()
    }
}
