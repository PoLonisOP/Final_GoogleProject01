//
//  ContentView2.swift
//  FinalProject
//
//  Created by User20 on 2019/12/26.
//  Copyright © 2019 000. All rights reserved.
//

import SwiftUI

struct ContentView2: View {
    
    @State private var moveDistance: CGFloat = 0
    @State private var showAlert = false
    @State private var showSSearch = false
    @State private var TiTle = ""
    
    /*func getGoogleAnimationLottie() {
        let urlStr = "https://assets2.lottiefiles.com/temp/lf20_6f6BQ8.json"
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { (data, response , error) in
                let decoder = JSONDecoder()
                
                if let data = data, let SearchResults = try? decoder.decode(SearchResults.self, from: data) {
                    self.ImItem = SearchResults.items
                }
            }.resume()
            
        }
        
    }*/
    
    var body: some View {
        ZStack(alignment: .top)  {
            Image("googlermbg")
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 500)
            .animation(.spring(dampingFraction: 0.1))
            TextField("Search", text: $TiTle, onEditingChanged: { (editing) in
                print("onEditingChanged", editing)
            })  {
                print(self.TiTle)
                if self.TiTle == "" || self.TiTle.count >= 20
                {
                    self.showAlert = true
                }
                else
                {
                    self.showSSearch = true
                }
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
                //.overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1))
                //.frame(width:300)
                //.multilineTextAlignment(.center)
            .background(Image("SSearch")
            .opacity(0.5))
           .alert(isPresented: $showAlert) { () -> Alert in
                var result = ""
                var result2 = ""
                  if self.TiTle == "" {
                     result = "未輸入！"
                     result2 = "8+9"
                  } else if self.TiTle.count >= 20{
                     result = "請以關鍵字搜索！"
                    result2 = "複製貼上仔"
                  }
                  return Alert(title: Text(result), message: Text(result2), primaryButton: .default(Text("我就是")), secondaryButton: .default(Text("我不小心喔")))
               }
            .sheet(isPresented: self.$showSSearch) {
                ContentView(showSSearch: self.$showSSearch, TiTle: self.$TiTle)
            }
            Spacer()
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
