//
//  CatTipsApp.swift
//  CatTips
//
//  Created by Johan Guenaoui on 02/08/2023.
//

import SwiftUI
import SwiftData

@main
struct CatTipsApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: [SavedCatsTips_Model.self, Folder_Model.self])
    }
}
