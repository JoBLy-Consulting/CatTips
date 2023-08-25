//
//  CatsTipsFavorites_View.swift
//  CatTips
//
//  Created by Johan Guenaoui on 03/08/2023.
//

import SwiftUI
import SwiftData

struct CatsTipsFavorites_View: View {
    var favoritesGrid:[GridItem] = [GridItem(.adaptive(minimum: 350))]
    @Query(sort:\SavedCatsTips_Model.creationDate, order:SortOrder.reverse) private var favorites:[SavedCatsTips_Model]
    var body: some View {
        VStack {
            Spacer()
            Text("My Favorites Tips")
                .font(.system(.title))
                .bold()
            ScrollView {
                Spacer()
                LazyVGrid(columns: favoritesGrid, spacing:20){
                    ForEach(favorites, id:\.id) { value in
                        FavoriteCatsTip_View(favoriteCatsTip: value)
                    }
                }
            }
        }
    }
}

#Preview {
    CatsTipsFavorites_View()
}
