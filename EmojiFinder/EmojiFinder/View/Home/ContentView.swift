//
//  ContentView.swift
//  EmojiFinder
//
//  Created by User50 on 17/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var emojis: [Emoji] = EmojiProvider.allEmojis()
    @State private var searchText: String = ""
    @State private var isRedacted: Bool = true
    
    
    
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
                NavigationLink {
                    EmojiDetail(emoji: emoji)
                } label: {
                    if isRedacted {
                        EmojiRow(emoji: emoji)
                            .redacted(reason: .placeholder)
                    } else {
                        EmojiRow(emoji: emoji)
                    }
                }


                
                    //EmojiRow(emoji: emoji)
                    //.listRowSeparator(.hidden)
            }
            .navigationTitle("Emoji")
            .refreshable {
                let newRow = EmojiProvider.allEmojis()
                    .randomElement()
                emojis.insert(newRow! ,at:0)
            }
            .onAppear{
                //melakukan pararel proses agar ui tetap berjalan saat
                //suatu proses belum selesai
                DispatchQueue.main
                    .asyncAfter(deadline: .now() + 2){
                        isRedacted = false
                    }
            }
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
