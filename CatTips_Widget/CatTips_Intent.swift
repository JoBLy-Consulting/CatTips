//
//  CatTips_Intent.swift
//  CatTips_WidgetExtension
//
//  Created by Johan Guenaoui on 06/09/2023.
//

import AppIntents
import SwiftUI
import SwiftData

struct CatTips_Intent: AppIntent {
    static var title: LocalizedStringResource = "Get a new Cats Tip"
    static var description = IntentDescription("Display a new Cats Tip")

    @MainActor
    func perform() async throws -> some IntentResult {
        let _modelContext = try ModelContainer(for: CurrentCatsTips_Model.self).mainContext
        let catsTip_Interactor = GetNewTip_Interactor()
        
        _modelContext.insert(CurrentCatsTips_Model(fact: await catsTip_Interactor.getNewCatsTip().fact))
        
        return .result()
    }
}
