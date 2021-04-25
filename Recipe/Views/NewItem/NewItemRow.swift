//
//  NewItemRow.swift
//  Recipe
//
//  Created by LIM MEI TING on 24/04/2021.
//

import SwiftUI

struct NewItemRow: View {
    var body: some View {
        Text("Newly In")
            .font(.headline)
            .padding(.leading, 15)
            .padding(.top, 5)
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                NewItem()
                NewItem()
            }
        }.padding(.leading, 15)
        .padding(.trailing, 15)
    }
}

struct NewItemRow_Previews: PreviewProvider {
    static var previews: some View {
        NewItemRow()
    }
}
