//
//  CatsTip_Controller.swift
//  CatTips
//
//  Created by Johan Guenaoui on 02/08/2023.
//

public protocol CatsTip_Controller_Protocol {
    var _catsTip_DataConnector: DataConnector {get}
    
    func getCatsTip() async -> CatsTip_Model
}

public struct CatsTip_Controller: CatsTip_Controller_Protocol {
    public let _catsTip_DataConnector = DataConnector()
    
    public func getCatsTip() async -> CatsTip_Model {
        return await _catsTip_DataConnector.getTip()
    }

}
