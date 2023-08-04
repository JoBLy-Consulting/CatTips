//
//  DataConnector.swift
//  CatTips
//
//  Created by Johan Guenaoui on 02/08/2023.
//
import Foundation
import MyFirstMacro

public struct DataConnector {
    public func getTip() async -> CatsTip_Model {
        
        var catsTip:CatsTip_Model = CatsTip_Model(fact: "", length: 0)
        
        let session = URLSession.shared
        
        let url = #IsURL("https://catfact.ninja/fact")
        
        do {
            let (data, _) = try await session.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(CatsTip_Model.self, from: data) {
                catsTip = decodedResponse
            } else {
                print("Unable to fetch data")
            }
        } catch {
            print("invalid data")
        }
        return catsTip
    }
}
