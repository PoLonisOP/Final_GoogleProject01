//
//  NetworkImage.swift
//  FinalProject
//
//  Created by User20 on 2019/12/26.
//  Copyright © 2019 000. All rights reserved.
//

import SwiftUI

struct NetworkImage: View {
    var url: URL
    @State private var uiImage = UIImage(systemName: "photo")!
    
    func downLoad() {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let uiImage = UIImage(data: data) {
                self.uiImage = uiImage
            }
        }.resume()
        
    }
    
    var body: some View {
        Image(uiImage: uiImage)
            .resizable()
            .onAppear {
                self.downLoad()
        }
    }
    
}

struct NetworkImage_Previews: PreviewProvider {
    static var previews: some View {
        NetworkImage(url: URL(string: "https://developer.apple.com/wwdc19/images/wwdc19-og.jpg")!)
    }
}
