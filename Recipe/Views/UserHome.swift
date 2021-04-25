//
//  UserHome.swift
//  Recipe
//
//  Created by LIM MEI TING on 24/04/2021.
//

import SwiftUI

struct UserHome: View {
    @State private var draftProfile = Profile.default
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Welcome \(draftProfile.username)")
                        .bold()
                        .font(.title)
                    
                    Divider()
                    
                    HStack {
                        Text("My Recipe")
                            .font(.headline)
                        Spacer()
                        ZStack {
                            Circle()
                                .foregroundColor(.red)
                            
                            Text("3")
                                .foregroundColor(.white)
                                .font(Font.system(size: 12))
                        }
                        .frame(width: 15, height: 15)
                        .opacity(1.0)
                    }
                }
                
                HStack {
                    NavigationLink(destination: RecipeEditPage()){
                        Text("Add More Recipe")
                            .fontWeight(.semibold)
                            .font(.headline)
                            .padding(.all, 30)
                            .foregroundColor(.red)
                    }
                }
                Divider()
            }
            .padding()
        }}
    
    
}

struct UserHome_Previews: PreviewProvider {
    static var previews: some View {
        UserHome()
    }
}
