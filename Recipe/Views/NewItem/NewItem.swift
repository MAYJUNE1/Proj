//
//  MostPopularItem.swift
//  Recipe
//
//  Created by LIM MEI TING on 24/04/2021.
//

import SwiftUI

struct NewItem: View {
    var body: some View {
        
        ZStack (alignment: .bottom) {
            Image("icybay")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
            Text("Awesome Title \naloha")
                .font(.largeTitle)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .multilineTextAlignment(.trailing)
           
        }
        .cornerRadius(5)
        .padding(.top, 15)
        
    }
}

struct NewItem_Previews: PreviewProvider {
    static var previews: some View {
        NewItem()
        
        
    }
}
