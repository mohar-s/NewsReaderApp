//
//  HomeContentView.swift
//  NewsReaderApp
//
//  Created by Mohar on 11/12/24.
//

import SwiftUI

struct HomeContentView: View {
    var body: some View {
        TabView {
            NewsTabView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
            
            SearchTabView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            BookmarkTabView()
                .tabItem {
                    Label("Saved", systemImage: "bookmark")
                }
        }
        
    }
}


#Preview {
    HomeContentView()
}
