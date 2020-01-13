//
//  ContentView.swift
//  FinalProject
//
//  Created by User20 on 2019/12/24.
//  Copyright © 2019 000. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var showSSearch: Bool
    @State private var ImItem = [Items]()
    @Binding var TiTle: String
    
    func fetchSearches() {
        let urlStr = "https://www.googleapis.com/customsearch/v1?cx=004143314178053174991:vtmpcrqprzo&key=AIzaSyA3a58wtQ03CNDwdBtmPmVWRP1hYUVCEV8&q=" + TiTle
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { (data, response , error) in
                let decoder = JSONDecoder()
                
                if let data = data, let SearchResults = try? decoder.decode(SearchResults.self, from: data) {
                    self.ImItem = SearchResults.items
                }
            }.resume()
            
        }
        
    }
    
    var body: some View {
        NavigationView {
            List(ImItem.indices, id: \.self) { (index)  in
                NavigationLink(destination: ContentViewWeb(item: self.ImItem[index])) {
                    Row(item: self.ImItem[index])
                    
                }
            }
            .navigationBarTitle(TiTle)
            .navigationBarItems(leading: Button(action: {
                self.showSSearch = false
                self.presentationMode.wrappedValue.dismiss()
            })
            {
                HStack {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            })
            .onAppear {
                self.fetchSearches()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(showSSearch: .constant(true), TiTle: .constant(""))
    }
}

