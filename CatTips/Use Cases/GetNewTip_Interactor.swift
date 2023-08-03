//
//  GetNewTip_Interactor.swift
//  CatTips
//
//  Created by Johan Guenaoui on 02/08/2023.
//
import SwiftUI

public protocol GetNewTip_Interactor_Protocol {
    var _catsTip_Controller:CatsTip_Controller {get}
    func getNewCatsTip() async -> CatsTip_Model
}

public struct GetNewTip_Interactor: GetNewTip_Interactor_Protocol {
    public let _catsTip_Controller  = CatsTip_Controller()
    
    public func getNewCatsTip() async -> CatsTip_Model{
        let newCatsTip = await _catsTip_Controller.getCatsTip()
        return newCatsTip
    }
}
