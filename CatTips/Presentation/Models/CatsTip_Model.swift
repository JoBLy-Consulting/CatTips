//
//  CatFact.swift
//  CatTips
//
//  Created by Johan Guenaoui on 02/08/2023.
//
import Foundation
import SwiftData

public struct CatsTip_Model:Codable {
    let fact:String
    let length:Int
}

@Model
final class SavedCatsTips_Model {
    var fact:String
    var creationDate: Date
    
    init(fact: String, creationDate: Date = .now) {
        self.fact = fact
        self.creationDate = creationDate
    }
}
