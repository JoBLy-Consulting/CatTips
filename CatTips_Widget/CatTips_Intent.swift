//
//  CatTips_Intent.swift
//  CatTips_WidgetExtension
//
//  Created by Johan Guenaoui on 06/09/2023.
//

import AppIntents
import SwiftUI

struct CurrentCatsTips {
    private static let sharedDefaults = UserDefaults.standard
    
    static func currentTip() -> String {
        sharedDefaults.string(forKey: "currentTip") ?? ""
    }
    
    static func getNewTip() async {
        let catsTip_Interactor = GetNewTip_Interactor()
        
        sharedDefaults.setValue(await catsTip_Interactor.getNewCatsTip().fact, forKey: "currentTip")
    }
}

struct CatTips_Intent: AppIntent {
    static var title: LocalizedStringResource = "Get a new Cats Tip"
    static var description = IntentDescription("Display a new Cats Tip")

    func perform() async throws -> some IntentResult {
        await CurrentCatsTips.getNewTip()
        return .result()
    }
}
