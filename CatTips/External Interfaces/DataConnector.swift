//
//  DataConnector.swift
//  CatTips
//
//  Created by Johan Guenaoui on 02/08/2023.
//
import Foundation

public struct DataConnector {
    public func getTip() async -> CatsTip_Model {
        
        var catsTip:CatsTip_Model = CatsTip_Model(fact: "", length: 0)
        let request = "https://catfact.ninja/fact"
        
        let session = URLSession.shared
        
        guard let url = URL(string: request) else {
            return catsTip
        }
        
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
