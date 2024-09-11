//
//  ContentView.swift
//  News Reader App
//
//  Created by Viraj1968883 on 10/09/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = NewsViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.articles) { article in
                NavigationLink(destination: ArticleDetailView(article: article)) {
                    ArticleRowView(article: article, isBookmarked: viewModel.isBookmarked(article))
                        .contextMenu {
                            Button(action: {
                                viewModel.toggleBookmark(for: article)
                            }) {
                                Text(viewModel.isBookmarked(article) ? "Remove Bookmark" : "Bookmark")
                                Image(systemName: viewModel.isBookmarked(article) ? "bookmark.fill" : "bookmark")
                            }
                        }
                }
            }
            .navigationTitle("News")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Picker("Category", selection: $viewModel.category) {
                            ForEach(["business", "entertainment", "general", "health", "science", "sports", "technology"], id: \.self) { category in
                                Text(category.capitalized).tag(category)
                            }
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
