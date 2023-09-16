//
//  CatsTipsFavorites_View.swift
//  CatTips
//
//  Created by Johan Guenaoui on 03/08/2023.
//

import SwiftUI
import SwiftData

struct CatsTipsFavorites_View: View {
    @Query(sort:\Folder_Model.creationDate, order:SortOrder.reverse) private var folders:[Folder_Model]
    @Environment(\.modelContext) private var _modelContext
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(folders, id:\.id) { folder in
                    NavigationLink(folder.name) {
                        FolderDetail_View(folderFilter: folder)
                    }
                }
                .onDelete(perform: { value in
                    value.map { folders[$0] }.forEach { _modelContext.delete($0) }
                })
            }
            .navigationTitle("My Favorites Tips")
            .listStyle(.plain)
        }
    }
}

#Preview {
    CatsTipsFavorites_View()
}
