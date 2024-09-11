//
//  NewsArticle.swift
//  News Reader App
//
//  Created by Viraj1968883 on 10/09/24.
//

import Foundation

// MARK: - NewsArticle
struct NewsArticle: Identifiable, Codable {
    let id = UUID()
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}
