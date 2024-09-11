//
//  ArticleDetailView.swift
//  News Reader App
//
//  Created by Viraj1968883 on 10/09/24.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: NewsArticle

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Load the image if available
                if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(maxWidth: .infinity)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .cornerRadius(10)
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                                .foregroundColor(.gray)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                }
                
                // Article title
                Text(article.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                
                // Display the content of the article
                Text(article.content ?? "No content available.")
                    .font(.body)
                    .foregroundColor(.primary)
                    .padding(.vertical)
                
                // Link to read the full article
                Link(destination: URL(string: article.url)!) {
                    Text("Read Full Article")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Article Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    ArticleDetailView(article: NewsArticle(source: <#T##Source#>, author: <#T##String?#>, title: <#T##String#>, description: <#T##String?#>, url: <#T##String#>, urlToImage: <#T##String?#>, publishedAt: <#T##String#>, content: <#T##String?#>))
//}
