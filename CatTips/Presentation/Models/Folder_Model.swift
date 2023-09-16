//
//  Folder_Model.swift
//  CatTips
//
//  Created by Johan Guenaoui on 15/09/2023.
//

import Foundation
import SwiftData

@Model
final class Folder_Model {
    var creationDate: Date
    var name:String
    @Relationship(deleteRule: .cascade, inverse: \SavedCatsTips_Model.folder) var catsTipsList: [SavedCatsTips_Model]
    
    init(nameInput: String, catsTipsList:[SavedCatsTips_Model] = [], creationDate: Date = .now) {
        self.name = nameInput
        self.creationDate = creationDate
        self.catsTipsList = []
        catsTipsList.forEach { value in
            self.catsTipsList.append(value)
        }
    }
}
