//
//  CatsTip_View.swift
//  CatTips
//
//  Created by Johan Guenaoui on 02/08/2023.
//

import SwiftUI

struct CatsTip_View: View {
    var Message:String
    var body: some View {
        if(!Message.isEmpty) {
            HStack {
                Spacer()
                GeometryReader { geom in
                    VStack(alignment: .center) {
                        Text(Message)
                            .padding(10)
                        
                    }
                    .background(Color.teal)
                    .foregroundColor(Color.white)
                    .frame(width: geom.size.width  , height: geom.size.width)
                    .shadow(color: Color.black.opacity(0.4), radius: 20, x: 0, y: 10)
                }
                Spacer()
            }
        }else{
            Spacer()
        }
    }
}

struct CatsTip_View_Previews: PreviewProvider {
    static var previews: some View {
        CatsTip_View(Message: "The first official cat show in the UK was organised at Crystal Palace in 1871.")
    }
}
