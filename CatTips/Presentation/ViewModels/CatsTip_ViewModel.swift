//
//  CatsTip_ViewModel.swift
//  CatTips
//
//  Created by Johan Guenaoui on 02/08/2023.
//
import SwiftUI

public protocol CatsTip_ViewModel_Protocol {
    var _currentCatsTip: CatsTip_Model {get set}
    var _catsTip_Interactor:GetNewTip_Interactor {get}
    
    func getCurrentCatsTip() -> CatsTip_Model
    func renewCatsTip() async
}

@Observable
public class CatsTip_ViewModel: CatsTip_ViewModel_Protocol {
    public var _currentCatsTip: CatsTip_Model = CatsTip_Model(fact: "", length: 0)
    public let _catsTip_Interactor  = GetNewTip_Interactor()
    
    public func getCurrentCatsTip() -> CatsTip_Model {
        return _currentCatsTip
    }

    @MainActor
    public func renewCatsTip() async {
        self._currentCatsTip = await _catsTip_Interactor.getNewCatsTip()
    }
}
