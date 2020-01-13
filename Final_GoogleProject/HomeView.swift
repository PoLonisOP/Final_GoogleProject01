//
//  HomeView.swift
//  FinalProject
//
//  Created by User20 on 2020/1/13.
//  Copyright © 2020 000. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView
        {
            ContentView2()
            .tabItem
            {
                Image(systemName: "info.circle")
                Text("Intro")
            }
            testView()
            .tabItem
            {
                Image(systemName: "person.crop.circle")
                Text("Profile")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
