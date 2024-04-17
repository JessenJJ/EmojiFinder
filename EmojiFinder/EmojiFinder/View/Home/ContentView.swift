//
//  ContentView.swift
//  EmojiFinder
//
//  Created by User50 on 17/04/24.
//

import SwiftUI

struct ContentView: View {
    var emojis: [Emoji] = EmojiProvider.allEmojis()
    @State private var searchText: String = ""
    
    var emojiSearchResult: [Emoji] {
        guard !searchText.isEmpty else {
            return emojis
        }
        return emojis.filter{emoji in
            emoji.name.lowercased()
                .contains(searchText.lowercased())
        }
        
    }
    
    var body: some View {
        NavigationStack{
            List(emojiSearchResult){ emoji in
                EmojiRow(emoji: emoji)
                    //.listRowSeparator(.hidden)
            }
            .navigationTitle("Emoji")
            .searchable(text: $searchText,placement: .navigationBarDrawer(displayMode:.always),
            prompt: "What emoji's that you're looking for?"
            )
            .overlay {
                if emojiSearchResult.isEmpty{
                    ContentUnavailableView.search(text: searchText)
                    }
                }

            //.listStyle(.plain)
        }
    }
    
}

#Preview {
    ContentView()
}
