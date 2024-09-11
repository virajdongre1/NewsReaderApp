//
//  ArticleRowView.swift
//  NewsReaderApp
//
//  Created by Viraj1968883 on 11/09/24.
//

import SwiftUI

struct ArticleRowView: View {
    let article: NewsArticle
    let isBookmarked: Bool
    
    var body: some View {
        HStack {
            if let urlToImage = article.urlToImage, let url = URL(string: urlToImage) {
                AsyncImage(url: url)
                    .frame(width: 80, height: 80)
                    .cornerRadius(8)
            }
            VStack(alignment: .leading, spacing: 5) {
                Text(article.title)
                    .font(.headline)
                Text(article.description ?? "")
                    .font(.subheadline)
                    .lineLimit(2)
                    .foregroundColor(.secondary)
            }
            Spacer()
            if isBookmarked {
                Image(systemName: "bookmark.fill")
                    .foregroundColor(.blue)
            }
        }
    }
}


//#Preview {
//    ArticleRowView()
//}
