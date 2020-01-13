//
//  ContentViewWeb.swift
//  FinalProject
//
//  Created by User20 on 2020/1/13.
//  Copyright © 2020 000. All rights reserved.
//

import SwiftUI

struct ContentViewWeb: View {
    @Environment(\.presentationMode) var presentationMode
    var item: Items
    @State private var showlink = true
    
    var body: some View {
        Text("Loading...")
        .sheet(isPresented: self.$showlink) {
            SafariViewController(url: self.item.link)
        }
    }
}

struct ContentViewWeb_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewWeb(item: Items(title: "", displayLink: "", snippet: "", link: URL(string: "https://developer.apple.com/wwdc19/")!, pagemap: tags(cse_image: [image(src: URL(string: "https://developer.apple.com/wwdc19/images/wwdc19-og.jpg")!)])))
    }
}
