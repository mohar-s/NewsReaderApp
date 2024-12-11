//
//  ArticleListView.swift
//  NewsReaderApp
//
//  Created by Mohar on 11/12/24.
//

import SwiftUI

struct ArticleListView: View {
    
    let articles: [Article]
    let categoryText: String
    @State private var selectedArticle: Article?
    
    var body: some View {
        List {
            ForEach(articles) { article in
                ArticleRowView(article: article)
                    .onTapGesture {
                        selectedArticle = article
                    }
            }
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .sheet(item: $selectedArticle) {
            
            // TODO: Open Detail Artical view, 
//            ArticleDetailView(categoryText: categoryText, article:  $0)
            
            // Open Safari view and laod the Artical URL
            SafariView(url: $0.articleURL)
                .edgesIgnoringSafeArea(.bottom)
        }
      
    }
}


#Preview {
    @Previewable @StateObject var articleBookmarkVM = ArticleBookmarkViewModel.shared
    NavigationView {
        ArticleListView(articles: Article.previewData , categoryText: "")
            .environmentObject(articleBookmarkVM)
    }
}
