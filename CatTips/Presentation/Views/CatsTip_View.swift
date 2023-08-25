//
//  CatsTip_View.swift
//  CatTips
//
//  Created by Johan Guenaoui on 02/08/2023.
//

import SwiftUI
import SwiftData

struct CatsTip_View: View {
    var Message:String
    @Environment(\.modelContext) private var _modelContext
    var body: some View {
        if(!Message.isEmpty) {
            VStack() {
                Spacer().frame(height:50)
                Button("Add to favorites") {
                    _modelContext.insert(SavedCatsTips_Model(fact: Message))
                }
                HStack() {
                    Spacer()
                    GeometryReader { geom in
                        VStack(alignment: .center) {
                            Text(Message)
                                .padding(10)
                            
                        }
                        .background(Color.teal)
                        .foregroundColor(Color.white)
                        .frame(width: geom.size.width  , height: geom.size.width, alignment:.top)
                        .shadow(color: Color.black.opacity(0.4), radius: 20, x: 0, y: 10)
                    }
                    Spacer()
                }
            }
        }else{
            Spacer()
        }
    }
}

#Preview {
    CatsTip_View(Message: "The first official cat show in the UK was organised at Crystal Palace in 1871.")
}
