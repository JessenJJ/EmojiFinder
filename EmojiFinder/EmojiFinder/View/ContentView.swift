//
//  ContentView.swift
//  EmojiFinder
//
//  Created by User50 on 17/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "person")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .foregroundStyle(.tint)
                
            Text("Hello, world!")
                .fontWeight(.bold)
                .padding(.top)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
