//
//  CatFact.swift
//  CatTips
//
//  Created by Johan Guenaoui on 02/08/2023.
//
import Foundation

public struct CatsTip_Model:Identifiable, Codable {
    public let id = UUID()
    
    let fact:String
    let length:Int
}
