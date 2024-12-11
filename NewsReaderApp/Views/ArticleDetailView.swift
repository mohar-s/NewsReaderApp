//
//  ArticleDetailView.swift
//  NewsReaderApp
//
//  Created by Mohar on 11/12/24.
//

import SwiftUI

struct ArticleDetailView: View {
    
    @EnvironmentObject var articleBookmarkVM: ArticleBookmarkViewModel
    
    let categoryText: String
    let article: Article
    var body: some View {
            VStack(spacing: 16) {
                AsyncImage(url: article.imageURL) { phase in
                    switch phase {
                    case .empty:
                        HStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                        
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        
                    case .failure:
                        HStack {
                            Spacer()
                            Image(systemName: "photo")
                                .imageScale(.large)
                            Spacer()
                        }
                        
                        
                    @unknown default:
                        fatalError()
                    }
                }
                .frame(minHeight: 200, maxHeight: 300)
                .background(Color.gray.opacity(0.3))
                .clipped()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(article.title)
                        .font(.headline)
                        .lineLimit(3)
                    
                    Text(article.descriptionText)
                        .font(.subheadline)
                        .lineLimit(2)
                    Text(article.contentText)
                        .font(.system(size: 20))
                    
                    Spacer()
                    HStack {
                        Text(article.captionText)
                            .lineLimit(1)
                            .foregroundColor(.secondary)
                            .font(.caption)
                        Text(" | ")
                        Text(categoryText)
                            .lineLimit(1)
                            .foregroundColor(.secondary)
                            .font(.caption)
                        
                        Spacer()
                        
                        Button {
                            toggleBookmark(for: article)
                        } label: {
                            Image(systemName: articleBookmarkVM.isBookmarked(for: article) ? "bookmark.fill" : "bookmark")
                        }
                        .buttonStyle(.bordered)
                        
                        Button {
                            presentShareSheet(url: article.articleURL)
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                        }
                        .buttonStyle(.bordered)
                    }
                }
                .padding([.horizontal, .bottom])
                
            }
    }
    
    private func toggleBookmark(for article: Article) {
        if articleBookmarkVM.isBookmarked(for: article) {
            articleBookmarkVM.removeBookmark(for: article)
        } else {
            articleBookmarkVM.addBookmark(for: article)
        }
    }
}


#Preview {
    @Previewable @StateObject var articleBookmarkVM = ArticleBookmarkViewModel.shared
    NavigationView {
        ArticleDetailView( categoryText: "Top Headlines", article: Article.previewData[0])
            .environmentObject(articleBookmarkVM)
    }
}

