//
//  MainView.swift
//  EmojiFinder
//
//  Created by Jessen Jie on 18/04/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem { Label("Emoji",systemImage: "ev.plug.dc.nacs") }
            Text("Map View")
                .tabItem {Label( "Location", systemImage:"binoculars")}
                .badge(4)
            Text("Settings Page")
                .tabItem { Label("Settings",systemImage: "gear") }
        }
    }
}

#Preview {
    MainView()
}
