//
//  Row.swift
//  FinalProject
//
//  Created by User20 on 2019/12/24.
//  Copyright © 2019 000. All rights reserved.
//

import SwiftUI

struct Row: View {
    var item: Items
    var body: some View {
        
        HStack {
            if item.pagemap.cse_image != nil {
                NetworkImage(url: item.pagemap.cse_image![0].src)
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            }
            
            VStack(alignment: .leading) {
                Text(item.title)
                    .bold()
                    .font(.title)
                    .foregroundColor(Color(red: 26.0/255.0, green: 14.0/255.0, blue: 171.0/255.0))
                Text(item.displayLink)
                    .font(.subheadline)
                    .foregroundColor(.green)
                Text(item.snippet)
                    .font(.caption)
            }
        }
    }
    
}

struct Row_Previews: PreviewProvider {
    static var previews: some View {
        Row(item: Items(title: "", displayLink: "", snippet: "", link: URL(string: "https://developer.apple.com/wwdc19/")!, pagemap: tags(cse_image: [image(src: URL(string: "https://developer.apple.com/wwdc19/images/wwdc19-og.jpg")!)])))
    }
}








//URL(string: "https://developer.apple.com/wwdc19/images/wwdc19-og.jpg")!
