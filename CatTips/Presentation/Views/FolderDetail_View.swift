//
//  NoFavoriteFolder_View.swift
//  CatTips
//
//  Created by Johan Guenaoui on 15/09/2023.
//

import SwiftUI
import SwiftData

struct FolderDetail_View: View {
    var favoritesGrid:[GridItem] = [GridItem(.adaptive(minimum: 350))]
    var folderFilter:Folder_Model
    var favorites:[SavedCatsTips_Model]
    
    init(folderFilter:Folder_Model){
        self.folderFilter = folderFilter
        self.favorites = folderFilter.catsTipsList
    }
    
    var body: some View {
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
