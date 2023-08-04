//
//  ContentView.swift
//  CatTips
//
//  Created by Johan Guenaoui on 02/08/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var _catsTip_ViewModel = CatsTip_ViewModel()
    @State var _showModal:Bool = false
    
    var body: some View {
        VStack {
            Text("Cats Tips !")
                .font(.largeTitle)
            Image("LogoCat")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:100)
                .foregroundColor(.accentColor)
                .padding()
            HStack{
                Button {
                    Task {
                        await _catsTip_ViewModel.renewCatsTip()
                    }
                } label: {
                    Text("Get a new tip")
                }
                .buttonStyle(.borderedProminent)
                Button(action:{
                    self._showModal = true
                }) {
                   Image(systemName: "star")
                        .font(.system(size: 20))
                }
                .sheet(isPresented: $_showModal, content: {
                    CatsTipsFavorites_View()
                })
            }
            CatsTip_View(Message: _catsTip_ViewModel.getCurrentCatsTip().fact)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
