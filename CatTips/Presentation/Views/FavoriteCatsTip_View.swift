//
//  FavoriteCatsTip_View.swift
//  CatTips
//
//  Created by Johan Guenaoui on 25/08/2023.
//

import SwiftUI
import SwiftData

struct FavoriteCatsTip_View: View {
    var favoriteCatsTip:SavedCatsTips_Model
    @Environment(\.modelContext) private var _modelContext
    
    var body: some View {
        VStack(alignment: .center) {
            Button(action:{
                _modelContext.delete(favoriteCatsTip)
            }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 35))
            }
            Text("added on \(favoriteCatsTip.creationDate.formatted())")
                .foregroundStyle(.yellow)
            Text(favoriteCatsTip.fact)
                .frame(width: 350, height:100)
            
        }
        .background(Color.teal)
        .foregroundStyle(.white)
        .shadow(color: Color.black.opacity(0.4), radius: 20, x: 0, y: 10)
    }
}

#Preview {
    FavoriteCatsTip_View(favoriteCatsTip: SavedCatsTips_Model(fact: "The first official cat show in the UK was organised at Crystal Palace in 1871.", creationDate: .now))
}
